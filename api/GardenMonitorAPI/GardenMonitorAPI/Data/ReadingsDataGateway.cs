namespace GardenMonitorAPI.Data
{
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using GardenMonitorAPI.Data.Entities;
    using GardenMonitorAPI.Data.Factories;
    using GardenMonitorAPI.Enums;
    using GardenMonitorAPI.Utitilities;
    using Microsoft.Azure.Cosmos;

    public class ReadingsDataGateway : IReadingsDataGateway
    {
        private readonly ICosmosDbClientFactory clientFactory;

        public ReadingsDataGateway(ICosmosDbClientFactory clientFactory)
        {
            this.clientFactory = clientFactory;
        }

        public async Task ClearReadings(string gardenId)
        {
            var client = this.clientFactory.GetOrCreateInstance();

            QueryDefinition query = new QueryDefinition(
                "select * from readings r where r.gardenId = @gardenId ")
                .WithParameter("@gardenId", gardenId);

            List<ReadingEntity> readings = new();
            using FeedIterator<ReadingEntity> resultSet = client.GetContainer(DatabaseMap.Id, DatabaseMap.Map[EntityType.Reading]).GetItemQueryIterator<ReadingEntity>(
                query,
                requestOptions: new QueryRequestOptions()
                {
                    PartitionKey = new PartitionKey(gardenId),
                    MaxItemCount = -1
                });

            while (resultSet.HasMoreResults)
            {
                FeedResponse<ReadingEntity> response = await resultSet.ReadNextAsync();
                if (response.Diagnostics != null)
                    readings.AddRange(response);
            }

            readings.ForEach(r => client.GetContainer(DatabaseMap.Id, DatabaseMap.Map[EntityType.Reading]).DeleteItemAsync<ReadingEntity>(r.Id.ToString(), new PartitionKey(gardenId)));
        }

        public async Task<IEnumerable<ReadingEntity>> GetReadings(string gardenId)
        {
            var client = this.clientFactory.GetOrCreateInstance();

            QueryDefinition query = new QueryDefinition(
                "select TOP 12 * from readings r where r.gardenId = @gardenId order by r.timeStamp asc")
                .WithParameter("@gardenId", gardenId);

            List<ReadingEntity> readings = new();
            using FeedIterator<ReadingEntity> resultSet = client.GetContainer(DatabaseMap.Id, DatabaseMap.Map[EntityType.Reading]).GetItemQueryIterator<ReadingEntity>(
                query,
                requestOptions: new QueryRequestOptions()
                {
                    PartitionKey = new PartitionKey(gardenId),
                    MaxItemCount = -1
                });

            while (resultSet.HasMoreResults)
            {
                FeedResponse<ReadingEntity> response = await resultSet.ReadNextAsync();
                if (response.Diagnostics != null)
                    readings.AddRange(response);
            }

            return readings;
        }

        public async Task<SettingsEntity> GetSettings(string gardenId)
        {
            var client = this.clientFactory.GetOrCreateInstance();

            QueryDefinition query = new QueryDefinition(
                "select * from settings s where s.gardenId = @gardenId ")
                .WithParameter("@gardenId", gardenId);

            List<SettingsEntity> settings = new();
            using FeedIterator<SettingsEntity> resultSet = client.GetContainer(DatabaseMap.Id, DatabaseMap.Map[EntityType.Settings]).GetItemQueryIterator<SettingsEntity>(
                query,
                requestOptions: new QueryRequestOptions()
                {
                    PartitionKey = new PartitionKey(gardenId),
                    MaxItemCount = 1
                });

            while (resultSet.HasMoreResults)
            {
                FeedResponse<SettingsEntity> response = await resultSet.ReadNextAsync();
                if (response.Diagnostics != null)
                    settings.AddRange(response);
            }

            if (settings.Any())
            {
                return settings.First();
            }

            SettingsEntity defaultSettings = new(gardenId);

            await this.UpsertSettings(defaultSettings);

            return defaultSettings;
        }

        public async Task<SettingsEntity> InsertReading(ReadingEntity reading)
        {
            var client = this.clientFactory.GetOrCreateInstance();

            await client.GetContainer(DatabaseMap.Id, DatabaseMap.Map[EntityType.Reading]).CreateItemAsync(reading, new PartitionKey(reading.GardenId.ToString()));

            return await this.GetSettings(reading.GardenId);
        }

        public async Task UpsertSettings(SettingsEntity settings)
        {
            var client = this.clientFactory.GetOrCreateInstance();

            await client.GetContainer(DatabaseMap.Id, DatabaseMap.Map[EntityType.Settings]).UpsertItemAsync(settings, new PartitionKey(settings.GardenId.ToString()));
        }
    }
}

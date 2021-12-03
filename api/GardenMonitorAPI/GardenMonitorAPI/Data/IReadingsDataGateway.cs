namespace GardenMonitorAPI.Data
{
    using System.Collections.Generic;
    using System.Threading.Tasks;
    using GardenMonitorAPI.Data.Entities;
    using GardenMonitorAPI.Enums;

    public interface IReadingsDataGateway
    {
        Task<SettingsEntity> InsertReading(ReadingEntity reading);

        Task<IEnumerable<ReadingEntity>> GetReadings(string gardenId, int pageSize);

        Task ClearReadings(string gardenId);

        Task UpsertSettings(SettingsEntity settings);

        Task<SettingsEntity> GetSettings(string gardenId);
    }
}

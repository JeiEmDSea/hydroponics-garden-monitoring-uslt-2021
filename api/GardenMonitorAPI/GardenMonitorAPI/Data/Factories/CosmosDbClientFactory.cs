using Microsoft.Azure.Cosmos;

namespace GardenMonitorAPI.Data.Factories
{
    public class CosmosDbClientFactory : ICosmosDbClientFactory
    {
        private static CosmosClient client;

        private readonly string connectionString;

        public CosmosDbClientFactory(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public CosmosClient GetOrCreateInstance()
        {
            if (client == null)
            {
                client = new CosmosClient(this.connectionString);
            }

            return client;
        }
    }
}

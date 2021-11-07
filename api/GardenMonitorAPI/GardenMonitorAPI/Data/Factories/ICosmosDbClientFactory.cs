using Microsoft.Azure.Cosmos;

namespace GardenMonitorAPI.Data.Factories
{
    public interface ICosmosDbClientFactory
    {
        CosmosClient GetOrCreateInstance();
    }
}

namespace GardenMonitorAPI.Extensions.Entities
{
    using GardenMonitorAPI.Data.Entities;
    using GardenMonitorAPI.Messages.Responses;

    public static class SettingsEntityExtensions
    {
        public static SettingsResponseModel AsResponse(this SettingsEntity settings)
        {
            return new SettingsResponseModel
            {
                MaxSoilMoisture = settings.MaxSoilMoisture,
                MinSoilMoisture = settings.MinSoilMoisture,
                MaxWaterLevel = settings.MaxWaterLevel,
                MinWaterLevel = settings.MinWaterLevel,
                MaxTemperature = settings.MaxTemperature,
                MaxPh = settings.MaxPh,
                MinPh = settings.MinPh,
                MinTds = settings.MinTds
            };
        }
    }
}

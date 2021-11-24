namespace GardenMonitorAPI.Extensions.WebModels
{
    using GardenMonitorAPI.Data.Entities;
    using GardenMonitorAPI.WebModels;

    public static class SettingsWebModelExtenions
    {
        public static SettingsEntity AsEntity(this SettingsWebModel model)
        {
            return new SettingsEntity
            {
                GardenId = model.GardenId,
                MaxSoilMoisture = model.MaxSoilMoisture,
                MinSoilMoisture = model.MinSoilMoisture,
                MaxWaterLevel = model.MaxWaterLevel,
                MinWaterLevel = model.MinWaterLevel,
                MaxTemperature = model.MaxTemperature,
                MinPh = model.MinPh,
                MaxPh = model.MaxPh,
                MinTds = model.MinTds
            };
        }
    }
}

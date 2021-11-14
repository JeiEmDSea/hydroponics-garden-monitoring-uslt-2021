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
                Id = model.Id,
                GardenId = model.GardenId,
                MaxSoilMoisture = model.MaxSoilMoisture,
                MinSoilMoisture = model.MinSoilMoisture,
                MaxWaterLevel = model.MaxWaterLevel,
                MinWaterLevel = model.MinWaterLevel,
                MaxHumidity = model.MaxHumidity,
                MinHumidity = model.MinHumidity,
                MaxTemperature = model.MaxTemperature,
                MinTemperature = model.MinTemperature
            };
        }
    }
}

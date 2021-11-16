namespace GardenMonitorAPI.Extensions.WebModels
{
    using System;
    using GardenMonitorAPI.Data.Entities;
    using GardenMonitorAPI.WebModels;

    public static class ReadingWebModelExtensions
    {
        public static ReadingEntity AsEntity(this ReadingWebModel model)
        {
            return new ReadingEntity
            {
                Id = Guid.NewGuid(),
                GardenId = model.GardenId,
                TimeStamp = DateTime.Now,
                SoilMoisture = model.SoilMoisture,
                WaterLevel = model.WaterLevel,
                Humidity = model.Humidity,
                Temperature = model.Temperature,
                PhLevel = model.PhLevel,
                Tds = model.Tds
            };
        }
    }
}

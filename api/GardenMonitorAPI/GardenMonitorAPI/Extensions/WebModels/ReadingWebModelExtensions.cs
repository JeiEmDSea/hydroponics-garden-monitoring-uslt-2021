using System;
using GardenMonitorAPI.Data.Entities;
using GardenMonitorAPI.WebModels;

namespace GardenMonitorAPI.Extensions.WebModels
{
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
                Temperature = model.Temperature
            };
        }
    }
}

namespace GardenMonitorAPI.Extensions.Entities
{
    using System.Collections.Generic;
    using System.Linq;
    using GardenMonitorAPI.Data.Entities;
    using GardenMonitorAPI.ViewModels;

    public static class ReadingsEntityExtensions
    {
        public static ReadingsViewModel AsResponse(this IEnumerable<ReadingEntity> readings)
        {
            return new ReadingsViewModel
            {
                SoilMoisture = readings.Select(r => r.SoilMoisture),
                WaterLevel = readings.Select(r => r.WaterLevel),
                Humidity = readings.Select(r => r.Humidity),
                Temperature = readings.Select(r => r.Temperature),
                PhLevel = readings.Select(r => r.PhLevel),
                Tds = readings.Select(r => r.Tds),
            };
        }
    }
}

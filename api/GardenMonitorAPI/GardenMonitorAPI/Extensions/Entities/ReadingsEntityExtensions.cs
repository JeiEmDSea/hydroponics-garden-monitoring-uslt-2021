namespace GardenMonitorAPI.Extensions.Entities
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using GardenMonitorAPI.Data.Entities;
    using GardenMonitorAPI.Enums;
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

        public static IEnumerable<ParameterReadingsViewmodel> AsResponse(this IEnumerable<ReadingEntity> readings, Parameter parameter)
        {
            return parameter switch
            {
                Parameter.SoilMoisture => readings.Select(r => new ParameterReadingsViewmodel(r.SoilMoisture, r.TimeStamp)),
                Parameter.WaterLevel => readings.Select(r => new ParameterReadingsViewmodel(r.WaterLevel, r.TimeStamp)),
                Parameter.Humidity => readings.Select(r => new ParameterReadingsViewmodel(r.Humidity, r.TimeStamp)),
                Parameter.Temperature => readings.Select(r => new ParameterReadingsViewmodel(r.Temperature, r.TimeStamp)),
                Parameter.PhLevel => readings.Select(r => new ParameterReadingsViewmodel(r.PhLevel, r.TimeStamp)),
                Parameter.Tds => readings.Select(r => new ParameterReadingsViewmodel(r.Tds, r.TimeStamp)),
                _ => throw new Exception("Invalid parameter type.")
            };
        }
    }
}

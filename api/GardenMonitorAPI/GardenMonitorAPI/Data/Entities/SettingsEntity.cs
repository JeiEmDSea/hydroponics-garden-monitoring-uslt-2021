﻿namespace GardenMonitorAPI.Data.Entities
{
    using System;
    using Newtonsoft.Json;

    public class SettingsEntity
    {
        public SettingsEntity()
        {
        }

        public SettingsEntity(string gardenId)
        {
            this.Id = Guid.NewGuid();
            this.GardenId = gardenId;
            this.MaxSoilMoisture = 100;
            this.MinSoilMoisture = 0;
            this.MaxWaterLevel = 100;
            this.MinWaterLevel = 0;
            this.MaxHumidity = 100;
            this.MinHumidity = 0;
            this.MaxTemperature = 50;
            this.MinTemperature = 25;
        }

        [JsonProperty("id")]
        public Guid Id { get; set; }

        [JsonProperty("gardenId")]
        public string GardenId { get; set; }

        [JsonProperty("maxSoilMoisture")]
        public int MaxSoilMoisture { get; set; }

        [JsonProperty("minSoilMoisture")]
        public int MinSoilMoisture { get; set; }

        [JsonProperty("maxWaterLevel")]
        public int MaxWaterLevel { get; set; }

        [JsonProperty("minWaterLevel")]
        public int MinWaterLevel { get; set; }

        [JsonProperty("maxHumidity")]
        public int MaxHumidity { get; set; }

        [JsonProperty("minHumidity")]
        public int MinHumidity { get; set; }

        [JsonProperty("maxTemperature")]
        public int MaxTemperature { get; set; }

        [JsonProperty("minTemperature")]
        public int MinTemperature { get; set; }
    }
}

using System;
using Newtonsoft.Json;

namespace GardenMonitorAPI.Data.Entities
{
    public class SettingsEntity
    {
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

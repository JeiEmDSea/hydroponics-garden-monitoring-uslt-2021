namespace GardenMonitorAPI.Data.Entities
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
            this.MaxSoilMoisture = 80;
            this.MinSoilMoisture = 20;
            this.MaxWaterLevel = 80;
            this.MinWaterLevel = 20;
            this.MaxTemperature = 30;
            this.MaxPh = 9;
            this.MinPh = 4;
            this.MinTds = 50;
        }

        [JsonProperty("id")]
        public Guid Id { get; set; }

        [JsonProperty("gardenId")]
        public string GardenId { get; set; }

        [JsonProperty("maxSoilMoisture")]
        public double MaxSoilMoisture { get; set; }

        [JsonProperty("minSoilMoisture")]
        public double MinSoilMoisture { get; set; }

        [JsonProperty("maxWaterLevel")]
        public double MaxWaterLevel { get; set; }

        [JsonProperty("minWaterLevel")]
        public double MinWaterLevel { get; set; }

        [JsonProperty("maxTemperature")]
        public double MaxTemperature { get; set; }

        [JsonProperty("minPh")]
        public double MinPh { get; set; }

        [JsonProperty("maxPh")]
        public double MaxPh { get; set; }

        [JsonProperty("minTds")]
        public double MinTds { get; set; }
    }
}

namespace GardenMonitorAPI.Data.Entities
{
    using System;
    using Newtonsoft.Json;

    public class ReadingEntity
    {
        [JsonProperty("id")]
        public Guid Id { get; set; }

        [JsonProperty("gardenId")]
        public string GardenId { get; set; }

        [JsonProperty("timeStamp")]
        public DateTime TimeStamp { get; set; }

        [JsonProperty("soilMoisture")]
        public float SoilMoisture { get; set; }

        [JsonProperty("waterLevel")]
        public float WaterLevel { get; set; }

        [JsonProperty("humidity")]
        public float Humidity { get; set; }

        [JsonProperty("temperature")]
        public float Temperature { get; set; }

        [JsonProperty("phLevel")]
        public float PhLevel { get; set; }

        [JsonProperty("tds")]
        public float Tds { get; set; }
    }
}

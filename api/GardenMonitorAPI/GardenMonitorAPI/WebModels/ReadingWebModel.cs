namespace GardenMonitorAPI.WebModels
{
    using Newtonsoft.Json;

    public class ReadingWebModel
    {
        [JsonProperty("gardenId")]
        public string GardenId { get; set; }

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

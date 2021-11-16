namespace GardenMonitorAPI.ViewModels
{
    using System.Collections.Generic;
    using Newtonsoft.Json;

    public class ReadingsViewModel
    {
        [JsonProperty("soilMoisture")]
        public IEnumerable<float> SoilMoisture { get; set; }

        [JsonProperty("waterLevel")]
        public IEnumerable<float> WaterLevel { get; set; }

        [JsonProperty("humidity")]
        public IEnumerable<float> Humidity { get; set; }

        [JsonProperty("temperature")]
        public IEnumerable<float> Temperature { get; set; }

        [JsonProperty("phLevel")]
        public IEnumerable<float> PhLevel { get; set; }

        [JsonProperty("tds")]
        public IEnumerable<float> Tds { get; set; }

    }
}

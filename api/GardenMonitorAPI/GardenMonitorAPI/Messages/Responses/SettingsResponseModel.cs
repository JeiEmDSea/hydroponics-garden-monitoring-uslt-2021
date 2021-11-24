namespace GardenMonitorAPI.Messages.Responses
{
    using Newtonsoft.Json;

    public class SettingsResponseModel
    {
        [JsonProperty("a")]
        public double MaxSoilMoisture { get; set; }

        [JsonProperty("b")]
        public double MinSoilMoisture { get; set; }

        [JsonProperty("c")]
        public double MaxWaterLevel { get; set; }

        [JsonProperty("d")]
        public double MinWaterLevel { get; set; }

        [JsonProperty("e")]
        public double MaxTemperature { get; set; }

        [JsonProperty("f")]
        public double MaxPh { get; set; }

        [JsonProperty("g")]
        public double MinPh { get; set; }

        [JsonProperty("h")]
        public double MinTds { get; set; }
    }
}

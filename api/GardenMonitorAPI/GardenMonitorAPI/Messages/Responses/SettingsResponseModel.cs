namespace GardenMonitorAPI.Messages.Responses
{
    using Newtonsoft.Json;

    public class SettingsResponseModel
    {
        [JsonProperty("a")]
        public int MaxSoilMoisture { get; set; }

        [JsonProperty("b")]
        public int MinSoilMoisture { get; set; }

        [JsonProperty("c")]
        public int MaxWaterLevel { get; set; }

        [JsonProperty("d")]
        public int MinWaterLevel { get; set; }

        [JsonProperty("e")]
        public int MaxHumidity { get; set; }

        [JsonProperty("f")]
        public int MinHumidity { get; set; }

        [JsonProperty("g")]
        public int MaxTemperature { get; set; }

        [JsonProperty("h")]
        public int MinTemperature { get; set; }
    }
}

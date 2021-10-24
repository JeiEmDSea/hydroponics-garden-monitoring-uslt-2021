using Newtonsoft.Json;

namespace GardenMonitorAPI.Messages.Requests
{
    public class SaveSensorDataWebRequest
    {
        [JsonProperty("humidity")]
        public float Humidity { get; set; }

        [JsonProperty("temperature")]
        public float Temperature { get; set; }
    }
}

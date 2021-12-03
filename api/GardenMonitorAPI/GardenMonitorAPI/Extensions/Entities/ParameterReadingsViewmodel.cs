namespace GardenMonitorAPI.Extensions.Entities
{
    using System;
    using Newtonsoft.Json;

    public class ParameterReadingsViewmodel
    {
        public ParameterReadingsViewmodel(float value, DateTime timeStamp)
        {
            this.Value = value;
            this.Timestamp = timeStamp;
        }

        [JsonProperty("value")]
        public float Value { get; set; }

        [JsonProperty("timeStamp")]
        public DateTime Timestamp { get; set; }
    }
}

namespace GardenMonitorAPI.Controllers
{
    using System.Threading.Tasks;
    using GardenMonitorAPI.Data;
    using GardenMonitorAPI.Data.Factories;
    using GardenMonitorAPI.Extensions.Entities;
    using GardenMonitorAPI.Extensions.WebModels;
    using GardenMonitorAPI.WebModels;
    using Microsoft.AspNetCore.Authorization;
    using Microsoft.AspNetCore.Mvc;
    using Newtonsoft.Json;

    [ApiController]
    [Route("garden")]
    public class GardenController : ControllerBase
    {
        private readonly IReadingsDataGateway dataGateway;

        public GardenController()
        {
            this.dataGateway = new ReadingsDataGateway(new CosmosDbClientFactory("AccountEndpoint=https://9f0463a8-0ee0-4-231-b9ee.documents.azure.com:443/;AccountKey=QR7ZZyPXFXYQo7Qli4taYnWNCO3l2jej15J7CLUhVgrdBeMDrhGQUNxYtgNC7GvynjE8OPeFzEutL9QKHo6eVA=="));
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> SaveSensorData([FromBody] ReadingWebModel model)
        {
            var response = (await this.dataGateway.InsertReading(model.AsEntity())).AsResponse();

            return this.Ok(JsonConvert.SerializeObject(response));
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetReadings([FromQuery] string gardenId)
        {
            var response = (await this.dataGateway.GetReadings(gardenId)).AsResponse();

            return this.Ok(JsonConvert.SerializeObject(response));
        }


        [HttpDelete]
        [AllowAnonymous]
        public async Task<IActionResult> ClearReadings([FromQuery] string gardenId)
        {
            await this.dataGateway.ClearReadings(gardenId);

            return this.Ok();
        }

        [HttpPost("settings")]
        [AllowAnonymous]
        public async Task<IActionResult> SaveSettings([FromBody] SettingsWebModel model)
        {
            await this.dataGateway.UpsertSettings(model.AsEntity());

            return this.Ok();
        }
    }
}


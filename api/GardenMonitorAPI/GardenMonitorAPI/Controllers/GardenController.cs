using System.Threading.Tasks;
using GardenMonitorAPI.Data;
using GardenMonitorAPI.Data.Factories;
using GardenMonitorAPI.Extensions.Entities;
using GardenMonitorAPI.Extensions.WebModels;
using GardenMonitorAPI.WebModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace GardenMonitorAPI.Controllers
{
    [ApiController]
    [Route("garden")]
    public class GardenController : ControllerBase
    {
        private readonly IReadingsDataGateway dataGateway;

        public GardenController()
        {
            this.dataGateway = new ReadingsDataGateway(new CosmosDbClientFactory("AccountEndpoint=https://localhost:8081/;AccountKey=C2y6yDjf5/R+ob0N8A7Cgv30VRDJIWEHLM+4QDU5DE2nQ9nDuVTqobD4b8mGGyPMbIZnqyMsEcaGQy67XIw/Jw=="));
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> SaveSensorDataAsync([FromBody] ReadingWebModel model)
        {
            var response = (await this.dataGateway.InsertReading(model.AsEntity())).AsResponse();

            return this.Ok(JsonConvert.SerializeObject(response));
        }

        [HttpDelete]
        [AllowAnonymous]
        public async Task<IActionResult> ClearReadings([FromQuery] string gardenId)
        {
            await this.dataGateway.ClearReadings(gardenId);

            return this.Ok();
        }
    }
}

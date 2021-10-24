using GardenMonitorAPI.Messages.Requests;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GardenMonitorAPI.Controllers
{
    [ApiController]
    [Route("garden")]
    public class GardenController : ControllerBase
    {
        [HttpPost]
        [AllowAnonymous]
        public IActionResult SaveSensorData([FromBody] SaveSensorDataWebRequest request)
        {
            return this.Ok(request);
        }
    }
}

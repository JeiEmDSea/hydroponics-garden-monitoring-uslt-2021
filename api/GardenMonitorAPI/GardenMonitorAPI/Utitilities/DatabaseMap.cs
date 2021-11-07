using System.Collections.Generic;
using GardenMonitorAPI.Enums;

namespace GardenMonitorAPI.Utitilities
{
    public static class DatabaseMap
    {
        public static Dictionary<EntityType, string> Map = new()
        {
            { EntityType.Reading, "readings"},
            { EntityType.Settings, "settings"}
        };

        public static string Id => "plantronics.db";
    }
}

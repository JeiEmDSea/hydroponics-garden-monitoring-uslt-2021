namespace GardenMonitorAPI.Utitilities
{
    using System.Collections.Generic;
    using GardenMonitorAPI.Enums;

    public static class DatabaseMap
    {
        public static Dictionary<EntityType, string> Map = new()
        {
            { EntityType.Reading, "readings" },
            { EntityType.Settings, "settings" }
        };

        public static string Id => "plantronics.db";
    }
}

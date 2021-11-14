﻿namespace GardenMonitorAPI.Data
{
    using System.Threading.Tasks;
    using GardenMonitorAPI.Data.Entities;

    public interface IReadingsDataGateway
    {
        Task<SettingsEntity> InsertReading(ReadingEntity reading);

        Task ClearReadings(string gardenId);

        Task UpsertSettings(SettingsEntity settings);

        Task<SettingsEntity> GetSettings(string gardenId);
    }
}

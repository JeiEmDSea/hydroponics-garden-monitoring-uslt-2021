class Settings {
  String gardenId;
  double maxSoilMoisture;
  double minSoilMoisture;
  double maxWaterLevel;
  double minWaterLevel;
  double maxTemperature;
  double maxPh;
  double minPh;
  double minTds;

  Settings({
    this.gardenId = 'plantronics1',
    this.maxSoilMoisture = 80.0,
    this.minSoilMoisture = 20.0,
    this.maxWaterLevel = 80.0,
    this.minWaterLevel = 20.0,
    this.maxTemperature = 30.0,
    this.maxPh = 9.0,
    this.minPh = 4.0,
    this.minTds = 50.0,
  });
}

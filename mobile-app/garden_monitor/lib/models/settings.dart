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

  Settings(
      {required this.gardenId,
      required this.maxSoilMoisture,
      required this.minSoilMoisture,
      required this.maxWaterLevel,
      required this.minWaterLevel,
      required this.maxTemperature,
      required this.maxPh,
      required this.minPh,
      required this.minTds});
}

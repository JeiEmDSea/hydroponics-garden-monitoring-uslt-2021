import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/models/settings.dart';

class SettingScreen extends StatelessWidget {
  final Settings settings;

  const SettingScreen({
    Key? key,
    required this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Settings'),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(settings);
        },
        child: const Icon(Icons.check),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: TextEditingController(text: settings.gardenId),
              decoration: InputDecoration(
                hintText: 'Garden id',
                hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
              onChanged: (value) {
                settings.gardenId = value;
              },
            ),
            Container(height: kDefaultPadding),
            TextField(
              controller: TextEditingController(
                  text: settings.maxSoilMoisture.toString()),
              decoration: InputDecoration(
                hintText: 'Max soil moisture',
                hintStyle: TextStyle(color: Colors.orange.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                settings.maxSoilMoisture = double.parse(value);
              },
            ),
            TextField(
              controller: TextEditingController(
                  text: settings.minSoilMoisture.toString()),
              decoration: InputDecoration(
                hintText: 'Min soil moisture',
                hintStyle: TextStyle(color: Colors.orange.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                settings.minSoilMoisture = double.parse(value);
              },
            ),
            Container(height: kDefaultPadding),
            TextField(
              controller: TextEditingController(
                  text: settings.maxWaterLevel.toString()),
              decoration: InputDecoration(
                hintText: 'Max water level',
                hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                settings.maxWaterLevel = double.parse(value);
              },
            ),
            TextField(
              controller: TextEditingController(
                  text: settings.minWaterLevel.toString()),
              decoration: InputDecoration(
                hintText: 'Min water level',
                hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                settings.minWaterLevel = double.parse(value);
              },
            ),
            Container(height: kDefaultPadding),
            TextField(
              controller: TextEditingController(
                  text: settings.maxTemperature.toString()),
              decoration: InputDecoration(
                hintText: 'Max temperature',
                hintStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                settings.maxTemperature = double.parse(value);
              },
            ),
            Container(height: kDefaultPadding),
            TextField(
              controller:
                  TextEditingController(text: settings.maxPh.toString()),
              decoration: InputDecoration(
                hintText: 'Max pH',
                hintStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                settings.maxPh = double.parse(value);
              },
            ),
            TextField(
              controller:
                  TextEditingController(text: settings.minPh.toString()),
              decoration: InputDecoration(
                hintText: 'Min pH',
                hintStyle: TextStyle(color: Colors.pink.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                settings.minPh = double.parse(value);
              },
            ),
            TextField(
              controller:
                  TextEditingController(text: settings.minTds.toString()),
              decoration: InputDecoration(
                hintText: 'Min TDS',
                hintStyle: TextStyle(color: Colors.purple.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                settings.minTds = double.parse(value);
              },
            )
          ],
        ),
      ),
    );
  }
}

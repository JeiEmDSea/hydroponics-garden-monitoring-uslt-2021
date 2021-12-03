import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_monitor/components/body.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/models/readings.dart';
import 'package:garden_monitor/models/settings.dart';
import 'package:garden_monitor/screens/settings_screen.dart';
import 'package:garden_monitor/services/readings_service.dart';
import 'package:garden_monitor/services/settings_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String baseUrl = 'https://plantronics-api.azurewebsites.net';

  final readingsService = ReadingsService(baseUrl);
  final settingsService = SettingsService(baseUrl);

  Readings readings = Readings(
      soliMoisture: [],
      waterLevel: [],
      humidity: [],
      temperature: [],
      phLevel: [],
      tds: []);

  late Settings settings;

  bool isLoading = false;

  @override
  void initState() {
    getReadings();
    getSettings();
    super.initState();
  }

  getReadings() async {
    setState(() {
      isLoading = true;
    });

    var result = await readingsService.getReadings('plantronics1');

    setState(() {
      isLoading = false;
      readings = result;
    });
  }

  getSettings() async {
    var result = await settingsService.getSettings('plantronics1');

    setState(() {
      settings = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () async {
                final Settings result = await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => SettingScreen(settings: settings)));

                var saveSettingsResult =
                    await settingsService.saveSettings(result);

                setState(() {
                  settings = saveSettingsResult;
                });
              },
              child: const Icon(
                Icons.settings,
              ),
              backgroundColor: kPrimaryColor,
              heroTag: null,
            ),
            FloatingActionButton(
              onPressed: () async {
                await getReadings();
              },
              child: const Icon(Icons.refresh),
              backgroundColor: kPrimaryColor,
              heroTag: null,
            ),
          ],
        ),
      ),
      body: Body(
        readings: readings,
        isLoading: isLoading,
        gardenId: settings.gardenId,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {},
      ),
    );
  }
}

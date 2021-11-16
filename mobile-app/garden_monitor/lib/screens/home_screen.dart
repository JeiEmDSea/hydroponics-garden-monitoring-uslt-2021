import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_monitor/components/body.dart';
import 'package:garden_monitor/constants.dart';
import 'package:garden_monitor/models/readings.dart';
import 'package:garden_monitor/screens/settings_screen.dart';
import 'package:garden_monitor/services/readings_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final readingsService = ReadingsService();

  Readings readings = Readings(
      soliMoisture: [1, 3, 4, 5, 2, 7],
      waterLevel: [1, 3, 4, 5, 2, 7],
      humidity: [1, 3, 4, 5, 2, 7],
      temperature: [1, 3, 4, 5, 2, 7],
      phLevel: [1, 3, 4, 5, 2, 7],
      tds: [1, 3, 4, 5, 2, 7]);

  bool isLoading = false;

  @override
  void initState() {
    getReadings();
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
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SettingScreen()));
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garden_monitor/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Settings'),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Garden id',
                hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
              ),
            ),
            Container(height: kDefaultPadding),
            TextField(
              decoration: InputDecoration(
                hintText: 'Max soil moisture',
                hintStyle: TextStyle(color: Colors.orange.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Min soil moisture',
                hintStyle: TextStyle(color: Colors.orange.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            Container(height: kDefaultPadding),
            TextField(
              decoration: InputDecoration(
                hintText: 'Max water level',
                hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Min water level',
                hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            Container(height: kDefaultPadding),
            TextField(
              decoration: InputDecoration(
                hintText: 'Max humidity',
                hintStyle: TextStyle(color: Colors.green.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Min humidity',
                hintStyle: TextStyle(color: Colors.green.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            Container(height: kDefaultPadding),
            TextField(
              decoration: InputDecoration(
                hintText: 'Max temperature',
                hintStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Min temperature',
                hintStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            Container(height: kDefaultPadding),
            TextField(
              decoration: InputDecoration(
                hintText: 'Max pH',
                hintStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Min pH',
                hintStyle: TextStyle(color: Colors.pink.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            Container(height: kDefaultPadding),
            TextField(
              decoration: InputDecoration(
                hintText: 'Max TDS',
                hintStyle: TextStyle(color: Colors.purple.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // On
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Min TDS',
                hintStyle: TextStyle(color: Colors.purple.withOpacity(0.5)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

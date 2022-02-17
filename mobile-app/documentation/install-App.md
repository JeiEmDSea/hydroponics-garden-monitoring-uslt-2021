# Install the mobile app

1. Open the project folder using VS Code.

<p align="center">
  <img src="images\open-project.png">
</p>

2. The contents in explorer should look like this.

<p align="center">
  <img src="images\project-contents.png">
</p>

3. Locate the home_screen code and modify the **baseUrl** with the forwarding url from the **NGROK WINDOW**

<p align="center">
  <img src="images\modify-home-screen-base-url.png">
</p>

4. Do the same with the info_card code.

<p align="center">
  <img src="images\modify-info-card-base-url.png">
</p>

5. Save the code.

6. Enable debugging in your phone. Uninstall any **Plantronics** app that already exists. Plug your phone into the PC and it should be selected in the device options on the bottom right corner of VS Code. If not already selected, try to click the device options and select your device.

<p align="center">
  <img src="images\mobile-device-selected.png">
</p>

7. Go to debugging tab and activate the Flutter launch settings by selecting from the dropdown.

<p align="center">
  <img src="images\activate-flutter-launch.png">
</p>

8. Press F5 to start debugging and wait for a few seconds to let the app install on your mobile device. The app will automatically start on your phone which confirms successful installation.

9. If in case an error occurs while debugging, just press F5 gradually until the error goes away.

10. You can stop the debugging by clicking this button. The app will remain installed on your phone and it'll work as long as the **API application** and **NGROK WINDOW** which you started ffrom the beginning is still up and running.

<p align="center">
  <img src="images\stop-debugging.png">
</p>

<br>
<p align="center">
  <a href="https://github.com/JeiEmDSea/Hydroponics-Garden-Monitoring/blob/master/arduino/documentation/run-Arduino.md">Prev</a>
  <span>•</span>
  <a href="https://github.com/JeiEmDSea/Hydroponics-Garden-Monitoring">Home</a>
</p>

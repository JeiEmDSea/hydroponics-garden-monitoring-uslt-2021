# Run NodeMCU

1. Locate the **NodeMCU** code. It should be under **(source code folder)→arduino→src→garden-monitor-nodemcu.ino**

<p align="center">
  <img src="images\locate-nodemcu-code.png">
</p>

2. Open the file in **Arduino IDE**.

3. Make sure that the Arduino and NodeMCU cable is not yet connected to your PC at this point. Under the device enclosure, there should be a slider switch. Sliding to the right means the Arduino and NodeMCU is linked. Slide the switch to the left to unlink them and plug only the NodeMCU cable to your PC.

4. In the Arduino IDE, select the appropriate port for the NodeMCU. The port number varies from PC to PC. If unsure, keep track of all the ports in the selection and unplug the NodeMCU cable. Whichever port number that isn't there should be the one you're looking for. Replug the cable and select that port. (keep track of the port number, that wont change unless you uninstall the drivers)

<p align="center">
  <img src="images\nodemcu-port-select.png">
</p>

5. On the Board menu, make sure that these values are set.

<p align="center">
  <img src="images\nodemcu-board-settings.png">
</p>

6. On the **NGROK WINDOW** (previous step), copy the http forwarding url. You can do this by selecting the text and pressing **Ctrl+C** but only once. Repeating **Ctrl+C** will shutdown the application and you'll need to redo everything from the start. For a much safer way, select the text and **Right-click**. That will automatically copy the url.

<p align="center">
  <img src="images\copy-http-forwarding-url.png">
</p>

7. Paste the copied text as **BASE_URL** value in the **NodeMCU** code.

<p align="center">
  <img src="images\paste-baseurl-value.png">
</p>

8. Update the Wifi credentials in the code. **STASSID** is the connection id and **STAPSK** is the password. This is case sensitive. Do not use pocket Wifis since such devices doesn't usually permit port forwarding. It's better to use a phone hotspot or connect to a PLDT wifi.

<p align="center">
  <img src="images\wifi-credentials.png">
</p>

9. Save and upload the program.

<p align="center">
  <img src="images\save-and-upload-nodemcu-program.png">
</p>

10. Start the NodeMCU program by opening the serial monitor.

<p align="center">
  <img src="images\open-serial-monitor.png">
</p>

11. Wait for some time until the Serial Monitor displays **"Connected! IP address: "**. Reopen the serial monitor if it takes more than 5 mins connecting to the network.

12. Keep the serial monitor open and proceed to the next steps.

<br>
<p align="center">
  <a href="https://github.com/JeiEmDSea/Hydroponics-Garden-Monitoring/blob/master/api/GardenMonitorAPI/documentation/run-API.md">Prev</a>
  <span>•</span>
  <a href="https://github.com/JeiEmDSea/Hydroponics-Garden-Monitoring/blob/master/arduino/documentation/run-Arduino.md">Next</a>
</p>

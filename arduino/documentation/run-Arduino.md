# Run Arduino

1. Locate the **Arduino** code. It should be under **(source code folder)→arduino→src→garden-monitor-mega.ino**

<p align="center">
  <img src="images\locate-arduino-code.png">
</p>

2. Open the file in **Arduino IDE**.

3. In the Arduino IDE, select the appropriate port for the Arduino. The port number varies from PC to PC. If unsure, keep track of all the ports in the selection and unplug the Arduino cable. Whichever port number that isn't there should be the one you're looking for. Replug the cable and select that port. (keep track of the port number, that wont change unless you uninstall the drivers)

<p align="center">
  <img src="images\arduino-port-select.png">
</p>

4. On the Board menu, make sure that these values are set.

<p align="center">
  <img src="images\arduino-board-settings.png">
</p>

5. Save and upload the program.

<p align="center">
  <img src="images\save-and-upload-arduino-program.png">
</p>

6. Start the NodeMCU program by opening the serial monitor.

<p align="center">
  <img src="images\open-serial-monitor.png">
</p>

7. Wait for some time until the Serial Monitor displays data.

8. Keep the serial monitor open and slide the switch to the right to link the Arduino to the NodeMCU. Wait for a few seconds and the NodeMCU's Serial Monitor should be also displaying some data. If that doesn't happen, keep the switch linked and restart the Arduino code by reopening it's Serial Monitor. Everything is running well if both Serial Monitor is displaying data.
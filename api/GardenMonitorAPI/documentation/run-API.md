# Run the API

1. Locate the project solution inside the source code folder. It should be under **(source code folder)→api→GardenMonitorAPI**.

<p align="center">
  <img src="images\locate-api-sln.png">
</p>

2. Open the solution in **Visual Studio 2019**

3. In the IDE, make sure that GardenMonitorAPI is selected on the run options.

<p align="center">
  <img src="images\select-api-start-settings.png">
</p>

4. Run the API application by clicking the start button.

<p align="center">
  <img src="images\start-api.png">
</p>

5. Keep the console window open.

<p align="center">
  <img src="images\console-app.png">
</p>

6. Right click on the start button and open an **administrator cmd**

<p align="center">
  <img src="images\open-admin-cmd.png">
</p>

7. In the command line, type in the following command and press enter:
```
ngrok http https://localhost:5001
```

<p align="center">
  <img src="images\start-ngrok.png">
</p>

8. Keep the window open. Refrain from pressing **Ctrl+C** as this will quit the application. Keep track of the forwarding http url as this will be used later. From now on this will be identified as **NGROK WINDOW**

<p align="center">
  <img src="images\running-ngrok.png">
</p>

9. Everything should be setup at this point. Do not close any console window.
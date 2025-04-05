# 📦 Godot Project Setup Guide

Follow these steps to set up the Geometry Dash-style game project in Godot.

---

## ✅ Requirements

- **Godot Engine** version 4.4 or later  
  Download from: [https://godotengine.org/](https://godotengine.org/)

---

## 🚀 Setup Instructions

1. **Install Godot Engine**  
   Download and install Godot 4.4+ from the official website.

2. **Download the Project Code**  
   Clone or download the project repository from GitHub:  
   [https://github.com/ZaydAlnabulsi/CMSC495-Geometry-Dash.git](https://github.com/ZaydAlnabulsi/CMSC495-Geometry-Dash.git)

3. **Import the Project in Godot**  
   - Launch Godot Engine.
   - On the main screen, click **"Import"** (top-left).
   - Navigate to the downloaded project folder.
   - Select the file `project.godot` and click **"Import & Edit"**.

4. **Run the Game**  
   - Once the project is open, click the **Play** button (▶) in the top-right corner to start the game.



**Make sure that you create your own new project that import all the files in. Certain config files like .editorconfig and .gitattributes will not upload correctly onto github.**

**Version 0.3**

  -Cleaned up folder and file structure with sub folders.
  
  -Created a new gameplay scene that will load the appropriate level and provide gameplay UI

  -Menu system is traversable 

**Version 0.2**

  -Added Spike object

  -Added Death sound effect

  -Added Timer delay of scene reload after death

  -Added temporary music to the background

  -Added External Collision detection for non-touchable objects like Spike to Player

  -Changed Level scene



**Version 0.1**
  -Added Player object

  -Added Floor object

  -Added Block object

  -Added Level scene

  -Added Collision Detection for Player, Block, and Floor objects

  -Added kill Collision Detection for Player

  -Changed direction of block collision detection to be downward facing only

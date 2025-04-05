# 🕹️ Geometry Dash-Style Platformer Game

This project is a 2D platformer game inspired by Geometry Dash, built using the Godot engine. It features auto-scrolling levels, obstacle navigation, and responsive jump mechanics, with a focus on smooth gameplay and modular design.
___

## 📚 Table of Contents

- [Godot Project Setup Guide](#-godot-project-setup-guide)
  - [Requirements](#-requirements)
  - [Setup Instructions](#-setup-instructions)
- [Versions](#versions)
  - [Version 0.3](#version-03)
  - [Version 0.2](#version-02)
  - [Version 0.1](#version-01)
- [Code Formatting & Naming Conventions](#️-code-formatting--naming-conventions)

---


# 📦 Godot Project Setup Guide

Follow these steps to set up the Geometry Dash-style game project in Godot.

## ✅ Requirements

- **Godot Engine** version 4.4 or later  
  Download from: [https://godotengine.org/](https://godotengine.org/)

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
   - Select the file `project.godot` and click **"Import"**.

4. **Run the Game**  
   - Once the project is open, click the **Play** button (▶) in the top-right corner to start the game.

---

# Versions
**Make sure that you create your own new project that import all the files in. Certain config files like .editorconfig and .gitattributes will not upload correctly onto github.**

## **Version 0.3**

  -Cleaned up folder and file structure with sub folders.
  
  -Created a new gameplay scene that will load the appropriate level and provide gameplay UI

  -Menu system is traversable 

## **Version 0.2**

  -Added Spike object

  -Added Death sound effect

  -Added Timer delay of scene reload after death

  -Added temporary music to the background

  -Added External Collision detection for non-touchable objects like Spike to Player

  -Changed Level scene

## **Version 0.1**
  -Added Player object

  -Added Floor object

  -Added Block object

  -Added Level scene

  -Added Collision Detection for Player, Block, and Floor objects

  -Added kill Collision Detection for Player

  -Changed direction of block collision detection to be downward facing only

---
# ✏️ Code Formatting & Naming Conventions

To maintain consistency and readability across the project, the following naming conventions are used:

- **Node Names (in scenes):** PascalCase  
  _Example: `PlayerSprite`, `JumpTimer`_

- **Filenames, Variables, Scene Names:** snake_case  
  _Example: `player.gd`, `jump_force`, `main_menu.tscn`_

- **Constants:** ALL_CAPS  
  _Example: `JUMP_FORCE`, `GRAVITY`_

- **Functions:** snake_case with a leading underscore  
  _Example: `_process(delta)`, `_on_jump_pressed()`_

---

# Dodge Challenge

A browser-based arcade game where players control a character to avoid falling obstacles.

## Project Overview

This game showcases web development skills using HTML5 Canvas and JavaScript. It's an ongoing project featured on [Career Cruise Control](https://careercruisecontrol.com).

## Features

- Fast-paced arcade gameplay
- Keyboard controls (arrow keys or A/D)
- Progressive difficulty
- Score tracking

## Upcoming Features

- Multiple enemy types
- Power-ups and special abilities
- Level progression
- Sound effects and music
- High score system

## Technical Details

- Built with vanilla JavaScript
- Uses HTML5 Canvas for rendering
- No external dependencies
- Responsive design

## How to Play

1. Open the game in a web browser
2. Click "Start Game"
3. Use the left/right arrow keys or A/D keys to move
4. Avoid the falling red squares
5. Try to get the highest score possible!

## Development

This is an ongoing project with regular updates. Feel free to contribute or suggest improvements!

## License

Copyright © Career Cruise Control. All rights reserved.
 
 ## Local Development

 To run the game locally:

 **Option 1:** Open `index.html` directly in your browser.

 **Option 2:** Use a simple HTTP server:

 ```bash
 cd path/to/dodgechallenge
 python3 -m http.server 8000
 ```

 Open [http://localhost:8000](http://localhost:8000) to play.

 ## Docker

 Build and run with Docker:

 ```bash
 docker build -t dodgechallenge .
 docker run -p 8080:80 dodgechallenge
 ```

 The game will be served on http://localhost:8080

 ## Environment Variables

 None required for this project.
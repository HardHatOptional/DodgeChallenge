# Git Setup Instructions

Follow these steps to initialize this project with Git and push it to GitHub or another Git hosting service.

## One-time Setup

1. **Install Git** if you haven't already:
   - Download from [git-scm.com](https://git-scm.com/downloads)
   - Follow the installation instructions for your operating system

2. **Set up your Git identity**:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

3. You already have a GitHub account as "HardHatOptional"

## Repository Setup

1. **Create a new repository on GitHub**:
   - Go to [github.com/new](https://github.com/new)
   - Name your repository `DodgeChallenge`
   - Leave "Initialize this repository with a README" unchecked
   - Click "Create repository"

2. **Initialize your local Git repository**:
   - Open a terminal/command prompt
   - Navigate to your DodgeChallenge project folder
   ```bash
   cd path/to/DodgeChallenge
   ```
   
   - Initialize the Git repository
   ```bash
   git init
   ```
   
   - Add all files to the staging area
   ```bash
   git add .
   ```
   
   - Commit the files
   ```bash
   git commit -m "Initial commit of Dodge Challenge game"
   ```
   
   - Link your local repository to the GitHub repository
   ```bash
   git remote add origin https://github.com/HardHatOptional/DodgeChallenge.git
   ```
   
   - Push your code to GitHub
   ```bash
   git push -u origin main
   ```
   
   Note: If your default branch is "master" instead of "main", use:
   ```bash
   git push -u origin master
   ```

## Making Changes

When you make changes to your game:

1. **Add the changes**:
   ```bash
   git add .
   ```

2. **Commit the changes**:
   ```bash
   git commit -m "Description of what you changed"
   ```

3. **Push to GitHub**:
   ```bash
   git push
   ```

## Using GitHub Pages to Host Your Game (Optional)

You can easily deploy your game using GitHub Pages:

1. Go to your repository on GitHub
2. Click "Settings"
3. Scroll down to "GitHub Pages" section
4. Select "main" (or "master") branch as the source
5. Click "Save"

Your game will be available at: https://HardHatOptional.github.io/DodgeChallenge/
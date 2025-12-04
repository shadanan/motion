# Apple Motion 5 Templates

Open source Apple Motion 5 templates for Final Cut Pro X.

## Available Templates

### Titles

- **Arrow** - Animated arrow graphic overlay
- **Bell** - Bell notification animation
- **Intro** - Introduction title sequence
- **Like** - Like/thumbs up animation
- **Pointer** - Pointer/cursor animation
- **Popper** - Popping text effect
- **Rectangle** - Rectangle shape overlay
- **Subscribe** - Subscribe button animation

### Effects

- **Popper** - Popping visual effect

## Installation

### Quick Install (Recommended)

Clone the repository and run the installation script:

```bash
git clone https://github.com/shadanan/motion.git
cd motion
./install.sh
```

### Manual Install

To install individual templates:

1. Clone the repository:

   ```bash
   git clone https://github.com/shadanan/motion.git
   ```

2. Copy the template folder to the appropriate Motion Templates directory:

   - **For Titles**: `~/Movies/Motion Templates.localized/Titles.localized`
   - **For Effects**: `~/Movies/Motion Templates.localized/Effects.localized`

   For example, to install the Subscribe title template:

   ```bash
   cp -r motion/titles/Subscribe "~/Movies/Motion Templates.localized/Titles.localized/"
   ```

3. Restart Final Cut Pro X if it's running

4. The template will appear in the Titles or Effects browser

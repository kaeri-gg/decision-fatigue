# Decision Fatigue

A board-style life simulator about the tiny choices that slowly eat your soul.

Modern adulthood is collapsing under the weight of constant choices: bills, kids, work deadlines, unstable relatives, and the emotional gymnastics of trying to stay “nice” while slowly burning out. Most people don’t realize how much these small, daily decisions drain their mental battery, until it’s empty.

Decision Fatigue turns this modern struggle into a playful, chaotic life simulator.
Every roll of the dice throws you into a new dilemma: a neighbor asking for money (again), a surprise hospital bill, a drunk relative accusing you of something ridiculous, or your child flooding the bathroom during your Zoom meeting.

The game pushes players to juggle their happiness, money, reputation, and relationships while feeling the rising tension of constant micro-decisions, showing how “just one more yes” can tip the emotional scale.

Through humor, relatable events, and cozy chaos, Decision Fatigue exposes the unseen stress of everyday life in a way that feels fun… and painfully real.

## Game Overview
Decision Fatigue is a single-player board-style life simulator where the player rolls dice, moves around a life-themed board, encounters events, and makes decisions that affect four key stats:

- **Happiness**

- **Money**

- **Respect**

- **Relationships**

**The goal is simple:**
survive multiple “spins of life” with your sanity, dignity, wallet, and social circle still intact.
Easier said than done.

Each tile presents a dilemma — from stressful parenting moments to petty friend drama — with choices that ripple into future scenarios.

## Core Loop
- Roll the dice to move across the board.
- Land on a tile (work, relatives, finances, parenting, emergencies, etc.).
- Face a dilemma — a stressful, hilarious slice of daily life.
- Choose (usually Yes/No) → your choice affects happiness, money, reputation, and relationships.

Watch long-term consequences unfold (standing changes unlock new events, shift relationships, or escalate problems).

Player time is spent balancing emotional wellbeing, finances, and social bonds — while slowly realizing how many decisions they make in a single “day.”

## Game Pillars
- **Relatable Choices** - Every scenario mirrors real-life frustrations: family drama, financial surprises, needy neighbors, and chaotic parenting moments.

- **Emotional Balance** - You’re not just managing stats — you’re managing how drained the character feels.

- **Social Consequence** - You can’t please everyone. Saying “yes” too often boosts relationships but destroys happiness. Saying “no” protects your sanity but damages your reputation.


## Unique Aspect
Unlike typical board games, Decision Fatigue emphasizes the emotional cost of everyday decisions.
Each choice — even small ones — chips away at your reliability, mood, or relationships, capturing the psychological exhaustion people experience in real life.

Even the nicest players eventually hit their limit… and the game asks:
_“How long can you survive being nice to everyone?”_

## Game Hook
Your happiness meter becomes the real currency of survival. Every tile is a gamble:
* Will this make you proud?
* Broke?
* Loved?
* Drained?

The board becomes a living diary of how much you can handle before your brain says “nope.”

## Future Improvements
1. **NPC Dialogue Reactivity**  - NPC reactions change based on your choices. If you keep saying “yes,” they’ll guilt-trip you: _**“Wow… I thought you were a good person.”**_
2. **Random Life Events** - Unexpected crises—like a sudden loss, an accident, or a hospital bill—appear without needing player input and create drastic standing changes.
3. **Standing-Based Event System** - Your stats unlock new problems (just like real life):
   * _High money_ → people ask you for favors more
   * _Low happiness_ → meltdown scenarios unlock
   * _High respect_ → heavier responsibilities
4. UI & Scenario Expansion - More dilemmas, refined tile layouts, cleaner UI, richer emotional storytelling.

## Features

* 40+ life event tiles (expanding)
* Stressful and funny Yes/No dilemmas
* Parent, work, financial, and social drama
* Ripple-effect decisions
* Light humor wrapped in emotional realism
* Cozy but brutally honest thematic tone

## Tech Stack
* Godot Engine 4.5
* GDScript
* JSON-based event system for decision tiles
* Modular tile and standing architecture for easy expansion

## 🌐 GitHub Pages Deployment

This project is configured for automatic deployment to GitHub Pages. Here's everything you need to know:

### 📋 **Deployment Setup**
**Prerequisites:**
- Repository must be public (for free GitHub Pages)
- GitHub Pages must be enabled in repository settings

**Setup Steps:**
1. Go to your repository **Settings** → **Pages**
2. Set **Source** to "Deploy from a branch"
3. Set **Branch** to `main` (root folder)
4. The game will auto-deploy on every push to `main` branch

### ⚙️ **Export Configuration (Important!)**

For Godot web exports to work on GitHub Pages, specific settings are required:

#### **In Godot Export Settings:**
1. **Project** → **Export** → Select **"Web"** preset
2. **Critical Settings** (must be disabled):
    - ✅ **Thread Support**: `OFF`
    - ✅ **Extensions Support**: `OFF`
3. **Export** your game to `index.html`

#### **Audio Bus Fix:**
All `AudioStreamPlayer` nodes must use the default **Master** bus only.

❌ **Remove these from .tscn files:**
```
bus = &"Music"
bus = &"SFX"
bus = &"Sound"
```

✅ **Use default bus (no bus line needed):**
```
[node name="AudioStreamPlayer2D" type="AudioStreamPlayer2D"]
stream = ExtResource("1_audio")
autoplay = true
```

### 🔧 **Troubleshooting Common Errors**

#### **Error: `SharedArrayBuffer transfer requires crossOriginIsolated`**
**Cause:** Threading is enabled in export settings  
**Fix:** Disable **Thread Support** in Godot export settings and re-export

#### **Error: `invalid bus index "-1"`**
**Cause:** Audio nodes reference non-existent audio buses  
**Fix:** Remove all `bus = &"BusName"` lines from scene files

#### **Error: `The following features required to run Godot projects on the Web are missing`**
**Cause:** Cross-Origin Isolation headers missing  
**Fix:** Ensure Thread Support is disabled (GitHub Pages doesn't support custom headers)

### 📝 **Post-Export Verification**

After exporting, verify your `index.html` contains:

```javascript
const GODOT_THREADS_ENABLED = false;
```
```javascript
"ensureCrossOriginIsolationHeaders": false
```

### 📁 **Required Files for Deployment**

Ensure these files are in your repository root:
- ✅ `index.html` (main game file)
- ✅ `index.js` (game engine)
- ✅ `index.wasm` (compiled game)
- ✅ `index.pck` (game assets)
- ✅ `index.icon.png` (favicon)
- ✅ `index.png` (loading splash)
- ✅ `.nojekyll` (disables Jekyll processing)
- ✅ `.github/workflows/deploy.yml` (auto-deployment)

### 🔄 **Automatic Deployment Workflow**

The repository includes a GitHub Actions workflow that:
1. **Triggers** on every push to `main` branch
2. **Deploys** all files to GitHub Pages automatically
3. **Updates** the live game within minutes

**Manual deployment trigger:** Go to **Actions** tab → **Deploy to GitHub Pages** → **Run workflow**

### 💡 **Development Tips**

**Local Testing:**
```bash
npx http-server --cert ~/cert.pem --key ~/key.pem --tls -o .
```

Run once if certs are not present (use gitHub bash)
```bash
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem
```

**Export Checklist:**
- [ ] Thread Support disabled
- [ ] Extensions Support disabled
- [ ] No custom audio buses used
- [ ] All files exported to repository root
- [ ] Local testing successful
- [ ] Committed and pushed to main branch

**Deployment Status:** Check the **Actions** tab for deployment progress and any errors.

## Credits
Designed & developed by **_[Kaeri](https://kaeri-gg.github.io/)_** 

Inspired by [Sort the Court](https://graebor.itch.io/sort-the-court), Monopoly and by real-life stress, chaotic relatives, loud neighbors, and the universal struggle of being “the responsible one.”
Music from #Uppbeat (free for Creators!): https://uppbeat.io/t/yasumu/springtime License code: HJ88EXRCJSRDDZBU
Images designed by pch.vector & pikisuperstar / Freepik and modified by **_[Kaeri](https://kaeri-gg.github.io/)_** 
Sound Effect by <a href="https://pixabay.com/users/u_qpfzpydtro-29496424/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=142528">u_qpfzpydtro</a> from <a href="https://pixabay.com//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=142528">Pixabay</a>

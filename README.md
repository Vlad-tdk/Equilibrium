# Equilibrium

<p align="center">
  <img src="https://img.shields.io/badge/platform-iOS-lightgrey.svg" alt="Platform: iOS">
  <img src="https://img.shields.io/badge/iOS-15.0+-blue.svg" alt="iOS 15.0+">
  <img src="https://img.shields.io/badge/Swift-5.7-orange.svg" alt="Swift 5.7">
  <img src="https://img.shields.io/badge/License-Apache--2.0-green.svg" alt="License: Apache-2.0">
</p>

<p align="center">
  <strong>Modern iOS Meditation & Relaxation App</strong><br>
  Breathing Practices • Visual Meditation • Interactive Particles<br>
  <br>
  <a href="https://apps.apple.com/app/id6470206215">
    <img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1234567890" alt="Download on the App Store" style="width: 200px;">
  </a>
</p>

---

## Overview

**Equilibrium** is a comprehensive meditation app built entirely with SwiftUI and zero external dependencies. The app combines scientifically-backed breathing techniques, visual meditation, and an innovative interactive particle system for deep relaxation.

### Why Equilibrium?

- **Full Customization** — tailor breathing parameters to your needs
- **Scientific Approach** — techniques based on heart rate coherence research
- **Advanced Visualization** — animated mandalas, nature scenes, fire
- **Smart Statistics** — progress tracking with streak system
- **Native Performance** — 60 FPS, optimized for iOS

---

## Key Features

### Guided Breathing

Fully customizable breathing exercises with visual animation:

- **Flexible Patterns**: inhale 2-8s, hold 0-5s, exhale 2-10s
- **Popular Techniques**: 4-7-8, Box Breathing, Coherence 5-5
- **Visual Feedback**: animated circle synchronized with breath
- **Cycle Counter**: real-time session progress tracking
- **Color Customization**: personalize background and elements

```
Popular Modes:
├─ Quick Practice (2 min): 3s inhale, 1s hold, 5s exhale × 10 cycles
├─ Standard (2.5 min): 4s inhale, 2s hold, 6s exhale × 10 cycles
├─ Deep Relaxation (5.5 min): 6s inhale, 4s hold, 8s exhale × 15 cycles
└─ Box Breathing: 4-4-4-4 for focus
```

### Visual Meditation

Three modes of visual relaxation:

**Mandalas**
- Animated GIF mandalas for gaze focus
- Fullscreen mode for complete immersion
- One-tap switching

**Calming Images**
- Gallery of high-quality nature scenes
- Slideshow mode with thumbnails
- Smooth transitions between images

**Fire Meditation**
- Realistic flame animation
- Immersive fullscreen mode
- Perfect for trataka (gaze fixation) practice

### Interactive Particles

Advanced particle system for stress relief through tactile interaction:

**Real-time Physics**
- 3000-6000 particles with individual physics
- Smooth 60 FPS animation
- Realistic behavior (inertia, friction, springs)

**Intuitive Interaction**
- Finger touch repels particles
- Particles smoothly return to place
- Adaptive interaction force

**Customizable Parameters**
- Particle size: 2-12pt
- Density: adjustable spacing
- Interaction radius: 20-200pt
- Repulsion force: 5-50
- Friction and springs
- 4 ready presets (Gentle, Dynamic, Fluid, Bouncy)

### Smart Statistics

Comprehensive progress tracking system:

**Overall Statistics**
- Total meditation sessions
- Total practice time
- Favorite technique
- Active days

**Detailed Metrics per Practice**
- Breathing exercises: sessions, time, cycles
- Mandalas: viewed, time
- Images: viewed, time
- Fire: practice time
- Particles: sessions, interactions

**Streak System**
- Current consecutive days
- Record streak
- Motivational messages
- Automatic tracking

### Smart Rating Requests

Non-intrusive rating request system:

- Shown only after 5 app sessions
- Requires minimum 3 completed breathing practices
- Request appears when user is relaxed (after meditation)
- No more than once every 90 days
- Easy to dismiss or postpone

### Onboarding

Beautiful app introduction:

- 4 screens explaining features
- Smooth gradient transitions
- Skip option available
- Shown only on first launch

---

## Screenshots

<div align="center">
  <img src="https://github.com/user-attachments/assets/e2554efb-780e-40bd-a91a-8ba8a3ebf79c" width="32%" />
  <img src="https://github.com/user-attachments/assets/194b54d0-cbfe-409e-b2d8-e9f6cd28a8ca" width="32%"/>
  <img src="https://github.com/user-attachments/assets/6524fac7-0a6b-4d5e-8e3e-0779fa892cab" width="32%"/>
  <img src="https://github.com/user-attachments/assets/ca33da26-ac75-4cc7-b04f-9dd65715d351" width="32%" />
  <img src="https://github.com/user-attachments/assets/826d135a-7e02-436c-8945-3c8bbbb30874" width="32%" />
  <img src="https://github.com/user-attachments/assets/5850b569-1072-418a-9f1b-b767061ef0bc" width="32%" />
  <img src="https://github.com/user-attachments/assets/bdbd586c-03c0-438f-be32-5863fcca9c4d" width="32%" />
  <img src="https://github.com/user-attachments/assets/67c3e411-80ba-4156-88c3-0185eff23c3e" width="32%" />
  <img src="https://github.com/user-attachments/assets/cca93b18-b662-4dff-a346-e0521b967911" width="32%" />
</div>

---

## Technical Details

### Architecture

The app is built using **MVVM (Model-View-ViewModel)** pattern with clean separation of concerns:

```
┌─────────────────────────────────────────┐
│          Presentation Layer             │
│  ┌──────────┐  ┌──────────┐  ┌────────┐│
│  │ MainView │  │ BreathView│  │ Stats  ││
│  │          │  │           │  │ View   ││
│  └──────────┘  └──────────┘  └────────┘│
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│         Business Logic Layer            │
│  ┌──────────────┐  ┌──────────────┐    │
│  │ Statistics   │  │ Particle     │    │
│  │ Manager      │  │ Effect Model │    │
│  └──────────────┘  └──────────────┘    │
└─────────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────────┐
│            Data Layer                   │
│  ┌──────────────┐  ┌──────────────┐    │
│  │ AppStatistics│  │ BreathSettings│   │
│  │ (Codable)    │  │ (Codable)     │   │
│  └──────────────┘  └──────────────┘    │
│         UserDefaults (JSON)             │
└─────────────────────────────────────────┘
```

### Tech Stack

```swift
• SwiftUI          // Declarative UI
• Combine          // Reactive programming
• Canvas API       // High-performance rendering
• AVFoundation     // GIF animation
• CoreImage        // Image processing
• UserDefaults     // Local storage
```

### Performance

- **60 FPS** — smooth animation on all screens
- **3000-6000 particles** — in Anti-Stress system
- **< 30% CPU** — efficient resource usage
- **No memory leaks** — value types and proper management
- **Adaptive load** — automatic device adjustment

### Zero External Dependencies

Project built entirely on native iOS frameworks:

```
✓ No CocoaPods
✓ No SPM dependencies
✓ No third-party libraries
✓ 100% native code
✓ Full control over codebase
```

---

## Project Structure

```
Equilibrium/
├── App/
│   └── EquilibriumApp.swift              # App entry point
│
├── Views/
│   ├── MainViews/
│   │   ├── MainView.swift                # Home screen
│   │   └── MeditationCard.swift          # Feature cards
│   │
│   ├── BreathViews/
│   │   ├── BreathView.swift              # Breathing UI
│   │   ├── BreathSettingsView.swift      # Customization
│   │   └── SettingSlider.swift           # Custom controls
│   │
│   ├── AntiStressViews/
│   │   ├── AntiStressView.swift          # Particle UI
│   │   ├── PhysicsGuideView.swift        # Help screen
│   │   └── PresetButton.swift            # Quick settings
│   │
│   ├── MandalaViews/
│   │   ├── MandalaView.swift             # Mandala viewer
│   │   └── MandalaGridItem.swift         # Grid cell
│   │
│   ├── CalmingImagesViews/
│   │   └── CalmingImagesView.swift       # Image gallery
│   │
│   ├── FireMeditation/
│   │   ├── FireMeditationView.swift      # Fire animation
│   │   └── FireSelectionItem.swift       # Fire selector
│   │
│   ├── StatisticsViews/
│   │   ├── StatisticsView.swift          # Stats display
│   │   └── StatsPeriod.swift             # Time filters
│   │
│   ├── Onboarding/
│   │   ├── LaunchScreenView.swift        # Splash screen
│   │   └── OnboardingView.swift          # 4-page intro
│   │
│   ├── AboutViews/
│   │   ├── AboutView.swift               # About screen
│   │   └── FeatureCard.swift             # Info cards
│   │
│   └── RatingPromptView.swift            # Rating dialog
│
├── ViewModels/
│   ├── BreathViewModel.swift             # Breathing logic
│   ├── CalmingImagesViewModel.swift      # Images logic
│   ├── FireMeditationViewModel.swift     # Fire logic
│   └── MandalaViewModel.swift            # Mandala logic
│
├── Models/
│   ├── AppStatistics.swift               # Statistics data
│   ├── BreathSettings.swift              # Breath config
│   ├── Particle.swift                    # Particle data
│   ├── ParticleEffectModel.swift         # Physics engine
│   ├── OnboardingPage.swift              # Onboarding data
│   ├── FeatureModel.swift                # Feature metadata
│   └── ShareSheet.swift                  # Share helper
│
├── Managers/
│   ├── StatisticsManager.swift           # Stats tracking
│   ├── RatingManager.swift               # Rating logic
│   ├── AudioPlayerManager.swift          # Music playback
│   └── StorageManager.swift              # Data persistence
│
├── Supporting Views/
│   ├── AnimatedGradientBackground.swift  # Gradient bg
│   ├── ParticleCanvas.swift              # Canvas renderer
│   ├── GIFImageView.swift                # GIF display
│   ├── ParameterSlider.swift             # Custom slider
│   ├── ColorPickerRow.swift              # Color picker
│   └── AchievementView.swift             # Milestone popup
│
├── Types/
│   └── MeditationType.swift              # Feature enum
│
├── Extensions/
│   ├── ColorExtensions.swift             # Hex colors
│   └── Extension+UIImage+Gif.swift       # GIF support
│
├── Resources/
│   ├── Assets.xcassets/                  # Images & icons
│   ├── Music/                            # Audio files
│   ├── Gif/                              # GIF animations
│   ├── Colors.swift                      # Color palette
│   ├── Icons.swift                       # SF Symbols
│   ├── L10n.swift                        # Localization
│   └── Resources.swift                   # Resource helpers
│
├── Docs/
│   ├── ARCHITECTURE.md                   # Architecture guide
│   ├── CHANGELOG.md                      # Version history
│   └── DESIGN_COMPARISON.md              # Design decisions
│
├── Localizable.xcstrings                 # String catalog
└── README.md                             # This file
```

---

## Installation & Setup

### Requirements

```
iOS 15.0+
Xcode 14.0+
Swift 5.7+
```

### Clone

```bash
git clone https://github.com/Vlad-tdk/Equilibrium.git
cd equilibrium
```

### Run

```bash
open Equilibrium.xcodeproj
```

Press `⌘ + R` to run

### Build

```bash
# Clean
⇧ + ⌘ + K

# Build
⌘ + B

# Run
⌘ + R
```

---

## Usage

### Basic Meditation Flow

```
1. Launch app
   ↓
2. LaunchScreen (2.5s animation)
   ↓
3. Onboarding (first launch)
   ↓
4. Select meditation type
   ↓
5. Complete practice
   ↓
6. Automatic statistics saving
   ↓
7. Rating request (conditional)
```

### Customizing Breathing Exercise

```swift
// Tap settings icon in BreathView

Parameters:
├─ Inhale: 2-8 seconds (0.5s step)
├─ Hold: 0-5 seconds (0.5s step)
├─ Exhale: 2-10 seconds (0.5s step)
├─ Circle diameter: 150-300pt
├─ Cycles: 5-20
├─ Background color: ColorPicker
└─ Circle color: ColorPicker

Automatic session time calculation
Reset to defaults button
Live preview of changes
```

### Working with Particles

```swift
// Open Anti-Stress

Interaction:
├─ Tap → particles repel
├─ Drag → continuous interaction
└─ Particles smoothly return

Settings (gear icon):
├─ Visual: size, density
├─ Force: radius, strength, smoothness
├─ Physics: velocity, friction, spring
└─ Presets: 4 ready configurations

Presets:
├─ Gentle: light breeze, relaxing
├─ Dynamic: energetic, responsive
├─ Fluid: flowing, water-like
└─ Bouncy: bouncing, playful
```

---

## Configuration

### Particle Physics Parameters

In `ParticleEffectModel.swift`:

```swift
// Density (lower = more particles)
var particleSpacing: CGFloat = 8

// Particle size
var particleSize: CGFloat = 3.37

// Interaction radius
var interactionRadius: CGFloat = 80

// Repulsion force
var forceStrength: CGFloat = 25

// Force smoothness
var forceSmoothness: CGFloat = 0.2

// Velocity multiplier
var particleVelocityFactor: CGFloat = 1.2

// Friction
var friction: CGFloat = 0.8

// Return force
var springStrength: CGFloat = 0.05
```

### Statistics Settings

In `RatingManager.swift`:

```swift
// Minimum sessions before first request
private let minSessionsBeforePrompt = 5

// Days between requests
private let minDaysBetweenPrompts = 90

// Minimum breathing sessions
private let minBreathSessions = 3
```

### Color Scheme

All colors use hex format via extension:

```swift
// Main screen
LinearGradient(
    colors: [
        Color(hex: "0f0c29"),  // Dark purple
        Color(hex: "302b63"),  // Purple
        Color(hex: "24243e")   // Dark blue
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

// Breathing (default)
backgroundColor: Color(hex: "4A90E2")  // Blue
circleColor: .white

// Particles
Gradients based on position and velocity
```

---

## Performance

### Optimizations

**Particle System:**
```swift
// Adaptive count
let spacing = ProcessInfo.processInfo.processorCount >= 6 ? 8 : 12

// Conditional rendering
guard hasUserInteracted else { return }

// Efficient updates
Timer.publish(every: 1/60, on: .main, in: .common)
```

**Memory Management:**
```swift
// Value types (struct) for auto-cleanup
struct Particle { }

// Weak self in closures
Timer.scheduledTimer { [weak self] in }

// No retain cycles
```

**Rendering:**
```swift
// Canvas API for hardware acceleration
Canvas { context, size in
    for particle in particles {
        context.fill(path, with: .color(particle.color))
    }
}
```

### Target Metrics

```
CPU: < 30%
FPS: 60 (stable)
Memory: Stable, no leaks
Battery: Minimal impact
Particles: 3000-6000
Frame time: < 16ms
```

### Profiling

```bash
# Open Instruments
Product → Profile (⌘ + I)

Tools:
├─ Time Profiler: CPU analysis
├─ Allocations: memory usage
├─ Leaks: memory leaks
└─ Energy Log: battery consumption
```

---

## Contributing

### How to Contribute

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Make changes
4. Test on real device
5. Commit (`git commit -m 'Add amazing feature'`)
6. Push (`git push origin feature/amazing-feature`)
7. Open Pull Request

### Code Style

```swift
// Follow Swift API Design Guidelines
// Comment complex algorithms
// Maximum 50 lines per function
// Maximum 3 nesting levels

// Good
func updateParticles() {
    guard hasInteraction else { return }
    applyForces()
    updatePositions()
}

// Bad
func updateParticles() {
    if hasInteraction {
        for particle in particles {
            if particle.isActive {
                if shouldUpdate(particle) {
                    // Deep nesting
                }
            }
        }
    }
}
```

### Pre-PR Checklist

```
[✓] Builds without warnings
[✓] Works on iOS 15+
[✓] Tested on iPhone
[✓] Tested on real device
[✓] No memory leaks (Instruments)
[✓] 60 FPS maintained
[✓] Statistics working correctly
[✓] Added comments to complex code
```

---

## Roadmap

### Version 2.1

- [ ] Weekly/monthly statistics charts
- [ ] Meditation goal setting
- [ ] Achievement system
- [ ] Data export (CSV/PDF)

### Version 2.2

- [ ] Time of day analysis
- [ ] Feature usage trends
- [ ] Mood correlation
- [ ] Social sharing

### Version 3.0

- [ ] Apple Watch app
- [ ] Home screen widgets
- [ ] Siri shortcuts
- [ ] HealthKit integration
- [ ] CloudKit sync
- [ ] Dark/Light theme

---

## License

Apache-2.0 license

---

## Contact

**Project Link:** [Equilibrium on GitHub](https://github.com/Vlad-tdk/Equilibrium)

**App Store:** https://apps.apple.com/rs/app/pacification/

**Email:** appequilibrium@icloud.com

---

## Acknowledgments

- SwiftUI team for the powerful declarative framework
- iOS community for inspiration and best practices
- Beta testers for valuable feedback
- All project contributors

---

<p align="center">
  <strong>Made with love using SwiftUI</strong><br>
  Zero external dependencies • Pure iOS code<br>
  <br>
  ⭐ Star this repo if you like the project!
</p>

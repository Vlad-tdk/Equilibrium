Equilibrium
<p align="center">
  <img src="https://img.shields.io/badge/platform-iOS-lightgrey.svg" alt="Platform: iOS">
  <img src="https://img.shields.io/badge/iOS-15.0+-blue.svg" alt="iOS 15.0+">
  <img src="https://img.shields.io/badge/Swift-5.7-orange.svg" alt="Swift 5.7">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT">
</p>
<p align="center">
  <strong>Modern iOS Meditation & Relaxation App</strong><br>
  Breathing Practices • Visual Meditation • Interactive Particles<br>
  <br>
  <a href="https://apps.apple.com/rs/app/pacification">
    <img src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg" alt="Download on the App Store" height="40">
  </a>
</p>

Overview
Equilibrium is a comprehensive meditation app built entirely with SwiftUI and zero external dependencies. The app combines scientifically-backed breathing techniques, visual meditation, and an innovative interactive particle system for deep relaxation.
Why Equilibrium?

Full Customization — tailor breathing parameters to your needs
Scientific Approach — techniques based on heart rate coherence research
Advanced Visualization — animated mandalas, nature scenes, fire
Smart Statistics — progress tracking with streak system
Native Performance — 60 FPS, optimized for iOS


Features
Guided Breathing
Fully customizable breathing exercises with visual animation:

Flexible patterns: inhale 2-8s, hold 0-5s, exhale 2-10s
Popular techniques: 4-7-8, Box Breathing, Coherence 5-5
Visual feedback with animated circle
Cycle counter and progress tracking
Color customization

Visual Meditation
Three modes of visual relaxation:

Mandalas — Animated GIF mandalas for gaze focus
Calming Images — High-quality nature scenes gallery
Fire Meditation — Realistic flame animation for trataka practice

Interactive Particles
Advanced particle system for stress relief:

3000-6000 particles with real-time physics
Smooth 60 FPS animation
Intuitive touch interaction
4 ready presets (Gentle, Dynamic, Fluid, Bouncy)
Customizable parameters (size, density, force, friction)

Smart Statistics
Comprehensive progress tracking:

Total sessions and practice time
Detailed metrics per feature
Daily streak system with motivational messages
Favorite technique tracking

Additional Features

Smart rating requests (non-intrusive)
Beautiful onboarding flow
Ambient background music
Localization support


Screenshots
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

Tech Stack
swiftSwiftUI          // Declarative UI framework
Combine          // Reactive programming
Canvas API       // High-performance rendering
AVFoundation     // GIF animation & audio
CoreImage        // Image processing
UserDefaults     // Local persistence


**Zero external dependencies** — 100% native iOS code

---

## Architecture

Built using **MVVM (Model-View-ViewModel)** pattern:
```
Presentation Layer (Views)
         ↓
Business Logic (ViewModels & Managers)
         ↓
Data Layer (Models & Storage)
```

### Key Design Patterns

- **Singleton Managers** for global state (Statistics, Rating, Audio)
- **Observable Objects** with Combine for reactive UI updates
- **Value Types** (structs) for models and particles
- **Protocol-oriented** design for extensibility

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
Installation
Requirements

iOS 15.0+
Xcode 14.0+
Swift 5.7+

Setup
bash# Clone repository
git clone https://github.com/Vlad-tdk/Equilibrium.git
cd equilibrium

# Open project
open Equilibrium.xcodeproj

# Build and run
⌘ + R

Usage
Basic Flow

Launch → Animated splash screen (2.5s)
Onboarding → 4-page introduction (first launch only)
Main Screen → Select meditation type
Practice → Complete session
Statistics → Auto-tracked progress
Rating → Smart request (conditional)

Customizing Breathing
Tap settings icon in BreathView:

Inhale: 2-8 seconds (0.5s step)
Hold: 0-5 seconds (0.5s step)
Exhale: 2-10 seconds (0.5s step)
Diameter: 150-300pt
Cycles: 5-20
Colors: Custom background and circle

Auto-calculated session time • Live preview • Reset to defaults
Using Particles
Open Anti-Stress view:

Tap → particles repel
Drag → continuous interaction
Settings → customize 8 parameters
Presets → Gentle, Dynamic, Fluid, Bouncy

```
Configuration
Physics Parameters
In ParticleEffectModel.swift:
swiftvar particleSize: CGFloat = 3.37           // Visual size
var particleSpacing: CGFloat = 8           // Density
var interactionRadius: CGFloat = 80        // Touch area
var forceStrength: CGFloat = 25            // Repulsion
var friction: CGFloat = 0.8                // Damping
var springStrength: CGFloat = 0.05         // Return force
Statistics Thresholds
In RatingManager.swift:
swiftlet minSessionsBeforePrompt = 5            // First request
let minDaysBetweenPrompts = 90             // Re-prompt interval
let minBreathSessions = 3                  // Engagement threshold
Color Scheme
All colors support hex format:
swiftColor(hex: "0f0c29")  // Dark purple
Color(hex: "302b63")  // Purple
Color(hex: "24243e")  // Dark blue
```

---

## Performance

### Optimizations

- **Canvas API** for hardware-accelerated rendering
- **Value types** for automatic memory management
- **Adaptive particle count** based on device capability
- **60 FPS** target with efficient update loop
- **Conditional rendering** to skip inactive elements

### Metrics

CPU Usage: < 30%
FPS: 60 (stable)
Memory: No leaks
Battery: Minimal impact
Particles: 3000-6000
Frame Budget: < 16ms
Profiling
bash# Open Instruments
Product → Profile (⌘ + I)

# Use:
- Time Profiler (CPU analysis)
- Allocations (memory usage)
- Leaks (memory leaks)
- Energy Log (battery impact)

Contributing
How to Contribute

Fork the repository
Create feature branch: git checkout -b feature/amazing-feature
Make changes and test thoroughly
Commit: git commit -m 'Add amazing feature'
Push: git push origin feature/amazing-feature
Open Pull Request

Code Style

Follow Swift API Design Guidelines
Maximum 50 lines per function
Maximum 3 nesting levels
Comment complex algorithms
Use meaningful variable names

Pre-PR Checklist

 Builds without warnings
 Tested on iOS 15+
 Works on iPhone and iPad
 Tested on real device
 No memory leaks (Instruments)
 60 FPS maintained
 Documentation updated


Documentation

Architecture Guide — Detailed architecture overview
Changelog — Version history and updates
Design Decisions — Design rationale


Roadmap
v2.1

 Weekly/monthly statistics charts
 Meditation goals
 Achievement system
 Data export (CSV/PDF)

v2.2

 Time of day analysis
 Usage trends
 Mood correlation
 Social sharing

v3.0

 Apple Watch app
 Widgets
 Siri shortcuts
 HealthKit integration
 CloudKit sync


License
Apache-2.0 license

Contact
Project: [Equilibrium на GitHub](https://github.com/Vlad-tdk/Equilibrium)
App Store: https://apps.apple.com/rs/app/pacification/
Email: appequilibrium@icloud.com

Acknowledgments

SwiftUI team for the powerful framework
iOS community for inspiration
Beta testers for valuable feedback
All contributors


<p align="center">
  <strong>Made with SwiftUI</strong><br>
  Zero dependencies • Pure iOS<br>
  <br>
  ⭐ Star this repo if you like it!
</p>
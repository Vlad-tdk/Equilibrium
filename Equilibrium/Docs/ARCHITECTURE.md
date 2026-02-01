# 🏗 Архитектура проекта Equilibrium 2.0

## 📊 Общая структура

```
Equilibrium/
├── App
│   └── EquilibriumApp.swift
├── Docs
│   ├── ARCHITECTURE.md
│   ├── CHANGELOG.md
│   └── DESIGN_COMPARISON.md
├── Extensions
│   ├── ColorExtensions.swift
│   └── Extension+UIImage+Gif.swift
├── Localizable.xcstrings
├── Managers
│   ├── AudioPlayerManager.swift
│   ├── RatingManager.swift
│   ├── StatisticsManager.swift
│   └── StorageManager.swift
├── Models
│   ├── AppStatistics.swift
│   ├── BreathSettings.swift
│   ├── ColorModel.swift
│   ├── ColorsModel.swift
│   ├── FeatureModel.swift
│   ├── OnboardingPage.swift
│   ├── Particle.swift
│   ├── ParticleEffectModel.swift
│   └── ShareSheet.swift
├── README.md
├── Resourses
│   ├── Colors.swift
│   ├── Gif
│   ├── Icons.swift
│   ├── L10n.swift
│   ├── Music
│   └── Resourses.swift
├── Supporting Views
│   ├── AchievementView.swift
│   ├── AnimatedGradientBackground.swift
│   ├── ColorPickerRow.swift
│   ├── GIFImageView.swift
│   ├── ParameterSlider.swift
│   └── ParticleCanvas.swift
├── Types
│   └── MeditationType.swift
├── ViewModels
│   ├── BreathViewModel.swift
│   ├── CalmingImagesViewModel.swift
│   ├── FireMeditationViewModel.swift
│   └── MandalaViewModel.swift
└── Views
    ├── AboutViews
    │   ├── AboutView.swift
    │   └── FeatureCard.swift
    ├── AntiStressViews
    │   ├── AntiStressView.swift
    │   ├── EnhancedSlider.swift
    │   ├── PhysicsGuideView.swift
    │   ├── PresetButton.swift
    │   └── SectionHeader.swift
    ├── BreathViews
    │   ├── BreathSettingsView.swift
    │   ├── BreathView.swift
    │   ├── SettingBadge.swift
    │   └── SettingSlider.swift
    ├── CalmingImagesViews
    │   └── CalmingImagesView.swift
    ├── FireMeditation
    │   ├── FireMeditationView.swift
    │   └── FireSelectionItem.swift
    ├── MainViews
    │   ├── MainView.swift
    │   └── MeditationCard.swift
    ├── MandalaViews
    │   ├── MandalaGridItem.swift
    │   └── MandalaView.swift
    ├── Onboarding
    │   ├── LaunchScreenView.swift
    │   └── OnboardingView.swift
    ├── RatingPromptView.swift
    └── StatisticsViews
        ├── StatisticsView.swift
        └── StatsPeriod.swift
```

## Архитектурные паттерны

### MVVM (Model-View-ViewModel)

```swift
┌─────────────────────────────────────────┐
│                 View                    │
│  (SwiftUI - Declarative UI)             │
│  - MainView                             │
│  - BreathView                           │
│  - MandalaView                          │
└──────────────┬──────────────────────────┘
               │ @StateObject
               │ @Binding
               │ @Published
               ▼
┌─────────────────────────────────────────┐
│             ViewModel                   │
│  (ObservableObject)                     │
│  - BreathViewModel                      │
│  - MandalaViewModel                     │
│  - ParticleEffectModel                  │
│  - Manages state & business logic       │
└──────────────┬──────────────────────────┘
               │ Uses
               ▼
┌─────────────────────────────────────────┐
│              Model                      │
│  (Data structures)                      │
│  - ColorModel                           │
│  - Particle                             │
│  - MeditationType                       │
└─────────────────────────────────────────┘
```

### Reactive Data Flow

```swift
// 1. User action
Button("START") {
    viewModel.startBreathing()
}

// 2. ViewModel updates state
@Published var isAnimating = false

func startBreathing() {
    isAnimating = true  // Triggers UI update
}

// 3. View automatically reacts
if viewModel.isAnimating {
    Text("Inhale")  // Appears automatically
}
```

## Структура экранов

### Navigation Flow

```
┌──────────────────────┐
│                      │
│     MainView         │
│  (NavigationView)    │
│                      │
└──────┬───────────────┘
       │
       ├─→ BreathView
       │   └─→ BreathSettingsView (sheet)
       │
       ├─→ MandalaView
       │   └─→ Fullscreen mode (overlay)
       │
       ├─→ CalmingImagesView
       │   └─→ Fullscreen mode (overlay)
       │
       ├─→ FireMeditationView
       │   └─→ Fullscreen mode (overlay)
       │
       ├─→ AntiStressView
       │   └─→ Settings panel (overlay)
       │
       └─→ AboutView
```

### State Management

```swift
// Local State (@State)
@State private var showSettings = false
@State private var selectedIndex = 0

// Observed State (@StateObject / @ObservedObject)
@StateObject private var viewModel = BreathViewModel()

// Environment (@Environment)
@Environment(\.dismiss) private var dismiss

// Bindings (@Binding)
ColorPicker("", selection: $viewModel.backgroundColor)
```

## Жизненный цикл View

### SwiftUI View Lifecycle

```swift
struct BreathView: View {
    @StateObject var viewModel = BreathViewModel()
    
    var body: some View {
        ZStack { ... }
            .onAppear {
                // View появилась
                viewModel.loadColors()
            }
            .onDisappear {
                // View исчезла
                viewModel.stopBreathing()
            }
            .onChange(of: viewModel.scale) { newValue in
                // Реакция на изменение state
            }
    }
}
```

## Persistence

### UserDefaults Strategy

```swift
// Saving
UserDefaults.standard.set(data, forKey: "breathBackgroundColor")

// Loading
if let data = UserDefaults.standard.data(forKey: "breathBackgroundColor") {
    // Decode
}

// Keys используемые в приложении:
- "SettingsBreathKey"          // Старый формат (можно мигрировать)
- "breathBackgroundColor"      // Новый формат
- "breathCircleColor"          // Новый формат
```

### Data Models для Persistence

```swift
// Codable для JSON serialization
struct ColorModel: Codable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

// Encode
let data = try JSONEncoder().encode(colorModel)

// Decode
let colorModel = try JSONDecoder().decode(ColorModel.self, from: data)
```

## Дизайн система

### Theme Structure

```swift
// Градиенты для каждого типа медитации
enum MeditationType {
    case breath
    case mandala
    // ...
    
    var gradientColors: [Color] {
        switch self {
        case .breath: 
            return [Color(hex: "6DD4FF"), Color(hex: "4A90E2")]
        // ...
        }
    }
}
```

### Spacing System (8pt grid)

```swift
.padding(8)      // Малый
.padding(16)     // Средний
.padding(20)     // Большой
.padding(30)     // Extra большой

// Corner radius
.cornerRadius(12)  // Малый
.cornerRadius(16)  // Средний
.cornerRadius(20)  // Большой
.cornerRadius(30)  // Кнопки
```

### Typography Scale

```swift
// Headers
.font(.system(size: 36, weight: .bold, design: .rounded))  // Main title
.font(.system(size: 28, weight: .bold, design: .rounded))  // Section title
.font(.system(size: 20, weight: .bold, design: .rounded))  // Card title

// Body
.font(.system(size: 18, weight: .semibold))  // Card subtitle
.font(.system(size: 16, weight: .medium))    // Body text
.font(.system(size: 14))                     // Small text
```

## Animation Strategy

### Spring Animations

```swift
// Default spring for most transitions
.spring(response: 0.4, dampingFraction: 0.8)

// Quick response
.spring(response: 0.3, dampingFraction: 0.7)

// Smooth breathing
.easeInOut(duration: 4.0)
```

### Animation States

```swift
// Scale animation
@State private var scale: CGFloat = 1.0

withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
    scale = 2.0
}

// Rotation animation
@Published var rotationAngle: Angle = .zero

Timer.scheduledTimer(...) {
    rotationAngle += .degrees(0.1)
}
```

## Dependency Injection

### Simple DI через initializers

```swift
struct BreathSettingsView: View {
    @ObservedObject var viewModel: BreathViewModel
    
    // Inject viewModel from parent
}
```

### Environment objects (если нужно)

```swift
// В будущем можно использовать для глобальных настроек
@EnvironmentObject var appSettings: AppSettings
```

## Testability

### Структура для тестов

```swift
// ViewModels testable
class BreathViewModel: ObservableObject {
    // All logic here - easy to unit test
    func startBreathing() { ... }
}

// Views are simple - snapshot/UI tests
struct BreathView: View {
    @StateObject var viewModel = BreathViewModel()
    // Just UI
}
```

## Performance Considerations

### Optimization Points

```swift
// 1. LazyVGrid для больших списков
LazyVGrid(columns: [...]) {
    ForEach(items) { item in
        ItemView(item: item)
    }
}

// 2. Canvas для custom drawing
Canvas { context, size in
    // GPU accelerated drawing
}

// 3. Async image loading (если нужно)
AsyncImage(url: url)

// 4. View identity для правильных animations
.id(item.id)
```

## Privacy & Security

### Permissions Required

```swift
// Info.plist keys (если нужно в будущем):
- NSMicrophoneUsageDescription (для записи медитации)
- NSPhotoLibraryAddUsageDescription (для сохранения изображений)
```

### Data Protection

```swift
// UserDefaults - non-sensitive data only
// For sensitive: use Keychain (не требуется сейчас)
```

## Future Extensions

### Planned Features Architecture

```swift
// 1. Settings Screen
struct SettingsView: View {
    @AppStorage("theme") var theme: Theme = .system
    @AppStorage("notifications") var notifications = true
}

// 2. Progress Tracking
class ProgressManager: ObservableObject {
    @Published var meditationMinutes: Int = 0
    @Published var streakDays: Int = 0
}

// 3. Custom Sounds
class SoundLibrary: ObservableObject {
    var availableSounds: [Sound] = []
    func addCustomSound(_ sound: Sound)
}
```

## Key Dependencies

### Built-in Frameworks

```swift
import SwiftUI          // UI framework
import AVFoundation     // Audio playback
import Combine          // Reactive programming
```

### Potential Future Dependencies

```swift
// GIF support
import SDWebImageSwiftUI

// Analytics (если нужно)
// import FirebaseAnalytics

// Cloud sync (если нужно)
// import CloudKit
```

## Code Organization Principles

### Single Responsibility

```swift
// Good
class BreathViewModel {
    func startBreathing() { ... }
    func stopBreathing() { ... }
}

// Bad
class BreathViewModel {
    func startBreathing() { ... }
    func saveSettings() { ... }  // Should be in SettingsManager
    func playAudio() { ... }     // Should be in AudioManager
}
```

### Declarative over Imperative

```swift
// SwiftUI way
if isAnimating {
    Text("Inhale")
}

// UIKit way
if isAnimating {
    label.isHidden = false
    label.text = "Inhale"
}
```

### Composition over Inheritance

```swift
// Compose views
struct MeditationCard: View {
    let type: MeditationType
    
    var body: some View {
        HStack {
            IconView(type: type)
            TextView(type: type)
        }
    }
}

// Don't subclass views
class CustomView: View { ... }  // Avoid
```

## 🏁 Summary

**Архитектура:**
- MVVM паттерн
- Reactive с Combine
- SwiftUI declarative UI
- UserDefaults для простых настроек

**Преимущества:**
- Легко тестировать
- Нативная производительность
- Консистентный дизайн
- Простое обслуживание

**Масштабируемость:**
- ➕ Легко добавлять новые медитации
- ➕ Легко добавлять настройки
- ➕ Готово к cloud sync
- ➕ Готово к iPad support

---

**Дата:** 30 января 2026
**Версия:** 2.0
**Архитектурный паттерн:** MVVM + SwiftUI
**Minimum iOS:** 15.0

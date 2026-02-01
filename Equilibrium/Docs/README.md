//
//  README.md
//  Equilibrium
//
//  Created by Vlad on 1. 2. 2026..
//

Equilibrium
<p align="center">
<img src="https://img.shields.io/badge/platform-iOS-lightgrey.svg" alt="Platform: iOS">
<img src="https://img.shields.io/badge/iOS-15.0+-blue.svg" alt="iOS 15.0+">
<img src="https://img.shields.io/badge/Swift-5.7-orange.svg" alt="Swift 5.7">
<img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT">
</p>
<p align="center">
<strong>Современное iOS приложение для медитации и релаксации</strong><br>
Дыхательные практики • Визуальная медитация • Интерактивные частицы<br>
<br>
<a href="https://apps.apple.com/app/equilibrium">
<img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/ru-ru?size=250x83&amp;releaseDate=1234567890" alt="Загружено в App Store" style="width: 200px;">
</a>
</p>

Описание
Equilibrium — это комплексное приложение для медитации, построенное полностью на SwiftUI без единой внешней зависимости. Приложение объединяет научно обоснованные дыхательные техники, визуальную медитацию и инновационную интерактивную систему частиц для глубокой релаксации.
Почему Equilibrium?

Полная кастомизация — настройте параметры дыхания под свои потребности
Научный подход — техники основаны на исследованиях когерентности сердечного ритма
Продвинутая визуализация — анимированные мандалы, природа, огонь
Умная статистика — отслеживание прогресса с системой серий
Нативная производительность — 60 FPS, оптимизация под iOS


Основные возможности
🌬️ Управляемое дыхание
Полностью настраиваемые дыхательные упражнения с визуальной анимацией:

Гибкие паттерны: вдох 2-8с, задержка 0-5с, выдох 2-10с
Популярные техники: 4-7-8, Box Breathing, Coherence 5-5
Визуальная обратная связь: анимированный круг синхронизирован с дыханием
Счётчик циклов: отслеживание прогресса сессии в реальном времени
Настройка цветов: персонализация фона и элементов

Популярные режимы:
├─ Быстрая практика (2 мин): 3с вдох, 1с задержка, 5с выдох × 10 циклов
├─ Стандарт (2.5 мин): 4с вдох, 2с задержка, 6с выдох × 10 циклов
├─ Глубокая релаксация (5.5 мин): 6с вдох, 4с задержка, 8с выдох × 15 циклов
└─ Box Breathing: 4-4-4-4 для концентрации
🎨 Визуальная медитация
Три режима визуальной релаксации:
Мандалы

Анимированные GIF мандалы для фокусировки взгляда
Полноэкранный режим для полного погружения
Переключение одним касанием

Успокаивающие изображения

Галерея природных сцен высокого качества
Режим слайд-шоу с миниатюрами
Плавные переходы между изображениями

Медитация на огонь

Реалистичная анимация пламени
Иммерсивный полноэкранный режим
Идеально для практики тратаки (фиксации взгляда)

✨ Интерактивные частицы
Продвинутая система частиц для снятия стресса через тактильное взаимодействие:
Физика в реальном времени

3000-6000 частиц с индивидуальной физикой
Плавная анимация 60 FPS
Реалистичное поведение (инерция, трение, пружины)

Интуитивное взаимодействие

Касание пальцем отталкивает частицы
Частицы плавно возвращаются на место
Адаптивная сила взаимодействия

Настраиваемые параметры

Размер частиц: 2-12pt
Плотность: регулируемое расстояние
Радиус взаимодействия: 20-200pt
Сила отталкивания: 5-50
Трение и пружины
4 готовых пресета (Gentle, Dynamic, Fluid, Bouncy)

📊 Умная статистика
Комплексная система отслеживания прогресса:
Общая статистика

Всего сессий медитации
Общее время практики
Любимая техника
Дни активности

Детальные метрики по каждой практике

Дыхательные упражнения: сессии, время, циклы
Мандалы: просмотрено, время
Изображения: просмотрено, время
Огонь: время практики
Частицы: сессии, взаимодействия

Система серий

Текущая серия дней подряд
Рекорд серии
Мотивационные сообщения
Автоматическое отслеживание

⭐ Умные запросы оценки
Ненавязчивая система запросов рейтинга:

Показывается только после 5 сессий приложения
Требуется минимум 3 завершённые дыхательные практики
Запрос появляется в момент расслабления (после медитации)
Не чаще одного раза в 90 дней
Легко отклонить или отложить

🎯 Онбординг
Красивое знакомство с приложением:

4 экрана с объяснением возможностей
Плавные градиентные переходы
Возможность пропустить (Skip)
Показывается только при первом запуске


Скриншоты
<p align="center">
<img src="screenshots/main.png" width="200" alt="Главный экран">
<img src="screenshots/breathing.png" width="200" alt="Дыхание">
<img src="screenshots/particles.png" width="200" alt="Частицы">
<img src="screenshots/statistics.png" width="200" alt="Статистика">
</p>

Технические детали
Архитектура
Приложение построено по паттерну MVVM (Model-View-ViewModel) с чистым разделением ответственности:
┌─────────────────────────────────────────┐
│          Presentation Layer             │
│  ┌──────────┐  ┌───────────┐  ┌────────┐│
│  │ MainView │  │ BreathView│  │ Stats  ││
│  │          │  │           │  │ View   ││
│  └──────────┘  └───────────┘  └────────┘│
└─────────────────────────────────────────┘
↓
┌─────────────────────────────────────────┐
│         Business Logic Layer            │
│  ┌──────────────┐  ┌──────────────┐     │
│  │ Statistics   │  │ Particle     │     │
│  │ Manager      │  │ Effect Model │     │
│  └──────────────┘  └──────────────┘     │
└─────────────────────────────────────────┘
↓
┌─────────────────────────────────────────┐
│            Data Layer                   │
│  ┌──────────────┐  ┌───────────────┐    │
│  │ AppStatistics│  │ BreathSettings│    │
│  │ (Codable)    │  │ (Codable)     │    │
│  └──────────────┘  └───────────────┘    │
│         UserDefaults (JSON)             │
└─────────────────────────────────────────┘
Стек технологий
swift- SwiftUI          // Декларативный UI
- Combine          // Реактивное программирование
- Canvas API       // Высокопроизводительный рендеринг
- AVFoundation     // GIF анимация
- CoreImage        // Обработка изображений
- UserDefaults     // Локальное хранение
```

### Производительность

- **60 FPS** — плавная анимация на всех экранах
- **3000-6000 частиц** — в системе Anti-Stress
- **< 30% CPU** — эффективное использование ресурсов
- **Нет утечек памяти** — value типы и правильное управление
- **Адаптивная нагрузка** — автоматическая подстройка под устройство

### Нет внешних зависимостей

Проект построен полностью на нативных iOS фреймворках:
```
✓ Нет CocoaPods
✓ Нет SPM зависимостей
✓ Нет сторонних библиотек
✓ 100% нативный код
✓ Полный контроль над кодовой базой
```

---

## Структура проекта
```
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

## Установка и запуск

### Требования
```
iOS 15.0+
Xcode 14.0+
Swift 5.7+
Клонирование
bashgit clone https://github.com/yourusername/equilibrium.git
cd equilibrium
Запуск
bashopen Equilibrium.xcodeproj
Нажмите ⌘ + R для запуска
Сборка
bash# Clean
⇧ + ⌘ + K

# Build
⌘ + B

# Run
⌘ + R
```

---

## Использование

### Базовый флоу медитации
```
1. Запуск приложения
↓
2. LaunchScreen (анимация 2.5с)
↓
3. Onboarding (первый запуск)
↓
4. Выбор типа медитации
↓
5. Выполнение практики
↓
6. Автоматическое сохранение статистики
↓
7. Запрос оценки (по условиям)
Настройка дыхательного упражнения
swift// В BreathView нажать на иконку настроек

Параметры:
├─ Вдох: 2-8 секунд (шаг 0.5с)
├─ Задержка: 0-5 секунд (шаг 0.5с)
├─ Выдох: 2-10 секунд (шаг 0.5с)
├─ Диаметр круга: 150-300pt
├─ Циклов: 5-20
├─ Цвет фона: ColorPicker
└─ Цвет круга: ColorPicker

Автоматический расчёт времени сессии
Кнопка сброса на дефолтные значения
Live preview изменений
Работа с частицами
swift// Открыть Anti-Stress

Взаимодействие:
├─ Tap → частицы отталкиваются
├─ Drag → непрерывное взаимодействие
└─ Частицы плавно возвращаются

Настройка (иконка шестерёнки):
├─ Visual: размер, плотность
├─ Force: радиус, сила, плавность
├─ Physics: скорость, трение, пружина
└─ Presets: 4 готовых настройки

Пресеты:
├─ Gentle: лёгкий ветерок, расслабляющий
├─ Dynamic: энергичный, отзывчивый
├─ Fluid: текучий, как вода
└─ Bouncy: отскакивающий, игривый

Конфигурация
Параметры физики частиц
В файле ParticleEffectModel.swift:
swift// Плотность (меньше = больше частиц)
var particleSpacing: CGFloat = 8

// Размер частиц
var particleSize: CGFloat = 3.37

// Радиус взаимодействия
var interactionRadius: CGFloat = 80

// Сила отталкивания
var forceStrength: CGFloat = 25

// Плавность силы
var forceSmoothness: CGFloat = 0.2

// Множитель скорости
var particleVelocityFactor: CGFloat = 1.2

// Трение
var friction: CGFloat = 0.8

// Сила возврата
var springStrength: CGFloat = 0.05
Настройки статистики
В файле RatingManager.swift:
swift// Минимум сессий до первого запроса
private let minSessionsBeforePrompt = 5

// Дни между запросами
private let minDaysBetweenPrompts = 90

// Минимум дыхательных сессий
private let minBreathSessions = 3
Цветовая схема
Все цвета используют hex формат через расширение:
swift// Главный экран
LinearGradient(
    colors: [
        Color(hex: "0f0c29"),  // Тёмно-фиолетовый
        Color(hex: "302b63"),  // Фиолетовый
        Color(hex: "24243e")   // Тёмно-синий
    ],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
)

// Дыхание (дефолт)
backgroundColor: Color(hex: "4A90E2")  // Синий
circleColor: .white

// Частицы
Градиенты на основе позиции и скорости

Производительность
Оптимизации
Система частиц:
swift// Адаптивное количество
let spacing = ProcessInfo.processInfo.processorCount >= 6 ? 8 : 12

// Условный рендеринг
guard hasUserInteracted else { return }

// Эффективное обновление
Timer.publish(every: 1/60, on: .main, in: .common)
Управление памятью:
swift// Value типы (struct) для автоочистки
struct Particle { }

// Weak self в замыканиях
Timer.scheduledTimer { [weak self] in }

// Нет retain cycles
Рендеринг:
swift// Canvas API для аппаратного ускорения
Canvas { context, size in
    for particle in particles {
        context.fill(path, with: .color(particle.color))
    }
}
```

### Целевые показатели
```
CPU: < 30%
FPS: 60 (стабильно)
Память: Стабильная, без утечек
Батарея: Минимальное влияние
Частиц: 3000-6000
Время кадра: < 16ms
Профилирование
bash# Открыть Instruments
Product → Profile (⌘ + I)

Инструменты:
├─ Time Profiler: анализ CPU
├─ Allocations: использование памяти
├─ Leaks: утечки памяти
└─ Energy Log: расход батареи

Вклад в проект
Как внести вклад

Форкните репозиторий
Создайте ветку фичи (git checkout -b feature/amazing-feature)
Внесите изменения
Протестируйте на реальном устройстве
Закоммитьте (git commit -m 'Add amazing feature')
Запушьте (git push origin feature/amazing-feature)
Откройте Pull Request

Стиль кода
swift// Следуйте Swift API Design Guidelines
// Комментируйте сложные алгоритмы
// Максимум 50 строк на функцию
// Максимум 3 уровня вложенности

// Хорошо
func updateParticles() {
    guard hasInteraction else { return }
    applyForces()
    updatePositions()
}

// Плохо
func updateParticles() {
    if hasInteraction {
        for particle in particles {
            if particle.isActive {
                if shouldUpdate(particle) {
                    // Глубокая вложенность
                }
            }
        }
    }
}
```

### Чеклист перед PR
```
[ ] Сборка без предупреждений
[ ] Работает на iOS 15+
[ ] Протестировано на iPhone и iPad
[ ] Протестировано на реальном устройстве
[ ] Нет утечек памяти (Instruments)
[ ] 60 FPS поддерживается
[ ] Статистика работает корректно
[ ] Добавлены комментарии к сложному коду
```

---

## Roadmap

### Версия 2.1

- [ ] Еженедельные/месячные графики статистики
- [ ] Установка целей медитации
- [ ] Система достижений
- [ ] Экспорт данных (CSV/PDF)

### Версия 2.2

- [ ] Анализ времени суток
- [ ] Тренды использования функций
- [ ] Корреляция с настроением
- [ ] Социальный шаринг

### Версия 3.0

- [ ] Apple Watch приложение
- [ ] Виджеты для главного экрана
- [ ] Siri shortcuts
- [ ] HealthKit интеграция
- [ ] CloudKit синхронизация
- [ ] Тёмная/светлая тема

---

## Лицензия

MIT License
```
Copyright (c) 2026 Equilibrium

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Контакты
Ссылка на проект: https://github.com/yourusername/equilibrium
App Store: https://apps.apple.com/app/equilibrium
Email: support@equilibrium.app

Благодарности

Команде SwiftUI за мощный декларативный фреймворк
iOS сообществу за вдохновение и best practices
Бета-тестерам за ценную обратную связь
Всем контрибьюторам проекта


<p align="center">
<strong>Сделано с любовью на SwiftUI</strong><br>
Без внешних зависимостей • Чистый iOS код<br>
<br>
⭐ Поставьте звезду если проект вам понравился!
</p>теперь тоже самое на английском20:04Equilibrium
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
<a href="https://apps.apple.com/app/equilibrium">
<img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/en-us?size=250x83&amp;releaseDate=1234567890" alt="Download on the App Store" style="width: 200px;">
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
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Key Features
                                                                                                                                                                                                                                                🌬️ Guided Breathing
                                                                                                                                                                                                                                                Fully customizable breathing exercises with visual animation:
                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                    Flexible Patterns: inhale 2-8s, hold 0-5s, exhale 2-10s
                                                                                                                                                                                                                                                Popular Techniques: 4-7-8, Box Breathing, Coherence 5-5
                                                                                                                                                                                                                                                Visual Feedback: animated circle synchronized with breath
                                                                                                                                                                                                                                                Cycle Counter: real-time session progress tracking
                                                                                                                                                                                                                                                Color Customization: personalize background and elements
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Popular Modes:
                                                                                                                                                                                                                                                    ├─ Quick Practice (2 min): 3s inhale, 1s hold, 5s exhale × 10 cycles
                                                                                                                                                                                                                                                ├─ Standard (2.5 min): 4s inhale, 2s hold, 6s exhale × 10 cycles
                                                                                                                                                                                                                                                ├─ Deep Relaxation (5.5 min): 6s inhale, 4s hold, 8s exhale × 15 cycles
                                                                                                                                                                                                                                                └─ Box Breathing: 4-4-4-4 for focus
                                                                                                                                                                                                                                                🎨 Visual Meditation
                                                                                                                                                                                                                                                Three modes of visual relaxation:
                                                                                                                                                                                                                                                    Mandalas
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Animated GIF mandalas for gaze focus
                                                                                                                                                                                                                                                Fullscreen mode for complete immersion
                                                                                                                                                                                                                                                One-tap switching
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Calming Images
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Gallery of high-quality nature scenes
                                                                                                                                                                                                                                                Slideshow mode with thumbnails
                                                                                                                                                                                                                                                Smooth transitions between images
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Fire Meditation
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Realistic flame animation
                                                                                                                                                                                                                                                Immersive fullscreen mode
                                                                                                                                                                                                                                                Perfect for trataka (gaze fixation) practice
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                ✨ Interactive Particles
                                                                                                                                                                                                                                                Advanced particle system for stress relief through tactile interaction:
                                                                                                                                                                                                                                                    Real-time Physics
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                3000-6000 particles with individual physics
                                                                                                                                                                                                                                                Smooth 60 FPS animation
                                                                                                                                                                                                                                                Realistic behavior (inertia, friction, springs)
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Intuitive Interaction
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Finger touch repels particles
                                                                                                                                                                                                                                                Particles smoothly return to place
                                                                                                                                                                                                                                                Adaptive interaction force
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Customizable Parameters
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Particle size: 2-12pt
                                                                                                                                                                                                                                                Density: adjustable spacing
                                                                                                                                                                                                                                                Interaction radius: 20-200pt
                                                                                                                                                                                                                                                Repulsion force: 5-50
                                                                                                                                                                                                                                                Friction and springs
                                                                                                                                                                                                                                                4 ready presets (Gentle, Dynamic, Fluid, Bouncy)
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                📊 Smart Statistics
                                                                                                                                                                                                                                                Comprehensive progress tracking system:
                                                                                                                                                                                                                                                    Overall Statistics
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Total meditation sessions
                                                                                                                                                                                                                                                Total practice time
                                                                                                                                                                                                                                                Favorite technique
                                                                                                                                                                                                                                                Active days
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Detailed Metrics per Practice
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Breathing exercises: sessions, time, cycles
                                                                                                                                                                                                                                                Mandalas: viewed, time
                                                                                                                                                                                                                                                Images: viewed, time
                                                                                                                                                                                                                                                Fire: practice time
                                                                                                                                                                                                                                                Particles: sessions, interactions
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Streak System
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Current consecutive days
                                                                                                                                                                                                                                                Record streak
                                                                                                                                                                                                                                                Motivational messages
                                                                                                                                                                                                                                                Automatic tracking
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                ⭐ Smart Rating Requests
                                                                                                                                                                                                                                                Non-intrusive rating request system:
                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                    Shown only after 5 app sessions
                                                                                                                                                                                                                                                Requires minimum 3 completed breathing practices
                                                                                                                                                                                                                                                Request appears when user is relaxed (after meditation)
                                                                                                                                                                                                                                                No more than once every 90 days
                                                                                                                                                                                                                                                Easy to dismiss or postpone
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                🎯 Onboarding
                                                                                                                                                                                                                                                Beautiful app introduction:
                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                    4 screens explaining features
                                                                                                                                                                                                                                                Smooth gradient transitions
                                                                                                                                                                                                                                                Skip option available
                                                                                                                                                                                                                                                Shown only on first launch
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Screenshots
                                                                                                                                                                                                                                                <p align="center">
                                                                                                                                                                                                                                                <img src="screenshots/main.png" width="200" alt="Main Screen">
                                                                                                                                                                                                                                                <img src="screenshots/breathing.png" width="200" alt="Breathing">
                                                                                                                                                                                                                                                <img src="screenshots/particles.png" width="200" alt="Particles">
                                                                                                                                                                                                                                                <img src="screenshots/statistics.png" width="200" alt="Statistics">
                                                                                                                                                                                                                                                </p>
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Technical Details
                                                                                                                                                                                                                                                Architecture
                                                                                                                                                                                                                                                The app is built using MVVM (Model-View-ViewModel) pattern with clean separation of concerns:
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
                                                                                                                                                                                                                                                Tech Stack
                                                                                                                                                                                                                                                swift- SwiftUI          // Declarative UI
                                                                                                                                                                                                                                                - Combine          // Reactive programming
                                                                                                                                                                                                                                                - Canvas API       // High-performance rendering
                                                                                                                                                                                                                                                - AVFoundation     // GIF animation
                                                                                                                                                                                                                                                - CoreImage        // Image processing
                                                                                                                                                                                                                                                - UserDefaults     // Local storage
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
                                                                                                                                                                                                                                                │   ├── EquilibriumApp.swift              # Entry point
                                                                                                                                                                                                                                                │   └── AppStateManager.swift              # State management
                                                                                                                                                                                                                                                │
                                                                                                                                                                                                                                                ├── Launch & Onboarding/
                                                                                                                                                                                                                                                │   ├── LaunchScreenView.swift             # Animated splash (2.5s)
                                                                                                                                                                                                                                                │   └── OnboardingView.swift               # 4-page introduction
                                                                                                                                                                                                                                                │
                                                                                                                                                                                                                                                ├── Main/
                                                                                                                                                                                                                                                │   ├── MainView.swift                     # Home screen
                                                                                                                                                                                                                                                │   └── AnimatedGradientBackground.swift   # Gradient background
                                                                                                                                                                                                                                                │
                                                                                                                                                                                                                                                ├── Features/
                                                                                                                                                                                                                                                │   ├── Breathing/
                                                                                                                                                                                                                                                │   │   ├── BreathView.swift               # Breathing UI
                                                                                                                                                                                                                                                │   │   └── BreathSettings.swift           # Settings (Codable)
                                                                                                                                                                                                                                                │   │
                                                                                                                                                                                                                                                │   ├── Meditation/
                                                                                                                                                                                                                                                │   │   ├── MandalaView.swift              # Mandala viewer
                                                                                                                                                                                                                                                │   │   ├── CalmingImagesView.swift        # Image gallery
                                                                                                                                                                                                                                                │   │   └── FireMeditationView.swift       # Fire animation
                                                                                                                                                                                                                                                │   │
                                                                                                                                                                                                                                                │   └── AntiStress/
                                                                                                                                                                                                                                                │       ├── Particle.swift                 # Particle model
                                                                                                                                                                                                                                                │       ├── ParticleEffectModel.swift      # Physics engine
                                                                                                                                                                                                                                                │       ├── ParticleCanvas.swift           # Rendering (Canvas API)
                                                                                                                                                                                                                                                │       └── AntiStressView.swift           # Particle UI
                                                                                                                                                                                                                                                │
                                                                                                                                                                                                                                                ├── Statistics/
                                                                                                                                                                                                                                                │   ├── StatisticsManager.swift            # Singleton for tracking
                                                                                                                                                                                                                                                │   └── StatisticsView.swift               # Statistics UI
                                                                                                                                                                                                                                                │
                                                                                                                                                                                                                                                ├── Rating/
                                                                                                                                                                                                                                                │   └── RatingManager.swift                # Smart rating requests
                                                                                                                                                                                                                                                │
                                                                                                                                                                                                                                                ├── Utilities/
                                                                                                                                                                                                                                                │   ├── Color+Extensions.swift             # Hex colors
                                                                                                                                                                                                                                                │   ├── UIImage+Gif.swift                  # GIF rendering
                                                                                                                                                                                                                                                │   └── Constants.swift                    # Constants
                                                                                                                                                                                                                                                │
                                                                                                                                                                                                                                                └── Resources/
                                                                                                                                                                                                                                                ├── Assets.xcassets/                   # Images and colors
                                                                                                                                                                                                                                                ├── Localizable.strings                # Localization
                                                                                                                                                                                                                                                └── Info.plist                         # Configuration
                                                                                                                                                                                                                                                ```
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                ---
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                ## Installation & Setup
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                ### Requirements
                                                                                                                                                                                                                                                ```
                                                                                                                                                                                                                                                iOS 15.0+
                                                                                                                                                                                                                                                Xcode 14.0+
                                                                                                                                                                                                                                                Swift 5.7+
                                                                                                                                                                                                                                                Clone
                                                                                                                                                                                                                                                bashgit clone https://github.com/yourusername/equilibrium.git
                                                                                                                                                                                                                                                cd equilibrium
                                                                                                                                                                                                                                                Run
                                                                                                                                                                                                                                                bashopen Equilibrium.xcodeproj
                                                                                                                                                                                                                                                Press ⌘ + R to run
                                                                                                                                                                                                                                                Build
                                                                                                                                                                                                                                                bash# Clean
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
                                                                                                                                                                                                                                                Customizing Breathing Exercise
                                                                                                                                                                                                                                                swift// Tap settings icon in BreathView
                                                                                                                                                                                                                                                
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
                                                                                                                                                                                                                                                Working with Particles
                                                                                                                                                                                                                                                swift// Open Anti-Stress
                                                                                                                                                                                                                                                
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
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Configuration
                                                                                                                                                                                                                                                Particle Physics Parameters
                                                                                                                                                                                                                                                In ParticleEffectModel.swift:
                                                                                                                                                                                                                                                    swift// Density (lower = more particles)
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
                                                                                                                                                                                                                                                Statistics Settings
                                                                                                                                                                                                                                                In RatingManager.swift:
                                                                                                                                                                                                                                                    swift// Minimum sessions before first request
                                                                                                                                                                                                                                                private let minSessionsBeforePrompt = 5
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                // Days between requests
                                                                                                                                                                                                                                                private let minDaysBetweenPrompts = 90
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                // Minimum breathing sessions
                                                                                                                                                                                                                                                private let minBreathSessions = 3
                                                                                                                                                                                                                                                Color Scheme
                                                                                                                                                                                                                                                All colors use hex format via extension:
                                                                                                                                                                                                                                                    swift// Main screen
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
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                Performance
                                                                                                                                                                                                                                                Optimizations
                                                                                                                                                                                                                                                Particle System:
                                                                                                                                                                                                                                                    swift// Adaptive count
                                                                                                                                                                                                                                                let spacing = ProcessInfo.processInfo.processorCount >= 6 ? 8 : 12
                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                // Conditional rendering
                                                                                                                                                                                                                                                guard hasUserInteracted else { return }

// Efficient updates
Timer.publish(every: 1/60, on: .main, in: .common)
Memory Management:
swift// Value types (struct) for auto-cleanup
struct Particle { }

// Weak self in closures
Timer.scheduledTimer { [weak self] in }

// No retain cycles
Rendering:
swift// Canvas API for hardware acceleration
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
Profiling
bash# Open Instruments
Product → Profile (⌘ + I)

Tools:
├─ Time Profiler: CPU analysis
├─ Allocations: memory usage
├─ Leaks: memory leaks
└─ Energy Log: battery consumption

Contributing
How to Contribute

Fork the repository
Create feature branch (git checkout -b feature/amazing-feature)
Make changes
Test on real device
Commit (git commit -m 'Add amazing feature')
Push (git push origin feature/amazing-feature)
Open Pull Request

Code Style
swift// Follow Swift API Design Guidelines
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
[ ] Builds without warnings
[ ] Works on iOS 15+
[ ] Tested on iPhone and iPad
[ ] Tested on real device
[ ] No memory leaks (Instruments)
[ ] 60 FPS maintained
[ ] Statistics working correctly
[ ] Added comments to complex code
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

MIT License
```
Copyright (c) 2026 Equilibrium

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Contact
Project Link: https://github.com/yourusername/equilibrium
App Store: https://apps.apple.com/app/equilibrium
Email: support@equilibrium.app

Acknowledgments

SwiftUI team for the powerful declarative framework
                    iOS community for inspiration and best practices
                    Beta testers for valuable feedback
                    All project contributors
                    
                    
                    <p align="center">
                    <strong>Made with love using SwiftUI</strong><br>
                    Zero external dependencies • Pure iOS code<br>
                    <br>
                    ⭐ Star this repo if you like the project!
                    </p>

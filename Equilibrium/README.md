# Equilibrium - Modern SwiftUI Version

## Что изменилось

### Основные улучшения:
- **Полностью убран Storyboard** - весь UI теперь программный
- **Современный SwiftUI интерфейс** - нативный, производительный, красивый
- **Современный дизайн** - градиенты, анимации, card-based UI
- **Улучшенная архитектура** - MVVM паттерн, чистый код
- **Никакой монетизации** - чистое приложение для медитации

### Технические изменения:
- SwiftUI вместо UIKit
- Modern navigation patterns
- Reactive data flow с @StateObject/@ObservedObject
- Smooth animations и transitions

## Структура новых файлов

```
Equilibrium/
├── App/
│   ├── AppDelegate.swift (обновлен)
│   ├── SceneDelegate.swift (обновлен - без storyboard)
│   └── Info.plist (обновлен - без storyboard reference)
│
├── Views/
│   ├── MainView.swift (главный экран)
│   ├── BreathView.swift (дыхательная тренировка)
│   ├── MandalaView.swift (медитация с мандалами)
│   ├── CalmingImagesView.swift (успокаивающие изображения)
│   ├── FireMeditationView.swift (медитация на огонь)
│   ├── AntiStressView.swift (уже был в SwiftUI)
│   └── AboutView.swift (о приложении)
│
├── Extensions/
│   └── ColorExtensions.swift
│
└── Models/
    └── (существующие модели остаются)
```
## Дизайн особенности

### Цветовая палитра:
- **Основной градиент**: Зеленовато-синий (#3E7352 → #6B94CB)
- **Breathing**: Голубой (#6DD4FF → #4A90E2)
- **Mandala**: Фиолетовый (#A18CD1 → #FBC2EB)
- **Images**: Циан (#89F7FE → #66A6FF)
- **Anti-Stress**: Зелено-синий (#6EE7B7 → #3B82F6)

### UI элементы:
- Закругленные карточки (20px radius)
- Плавные анимации (.spring)
- Полупрозрачные overlay (.white.opacity(0.1))
- Тени для глубины
- SF Symbols иконки

## Требования

- iOS 15.0+
- Xcode 14.0+
- Swift 5.7+
- SwiftUI framework

## Примечания

### Звуковые файлы:
Убедитесь, что звуковые файлы добавлены в проект:
- `soundsOfTheForest.mp3`
- `fire.mp3` (если используется)

### Изображения:
Убедитесь, что все изображения добавлены в Assets:
- Мандалы: m1-m15
- Успокаивающие изображения: 1-83
- Fire GIF изображения: sv, sv2, cos

### GIF анимации:
Для fire meditation нужно интегрировать GIF библиотеку:
- SDWebImageSwiftUI
- или Kingfisher
- или оставить существующий UIImage extension

## Известные моменты

1. **GIF анимации**: В FireMeditationView используется placeholder для GIF. Нужно либо:
   - Интегрировать SDWebImageSwiftUI
   - Использовать существующий UIImage+Gif extension через UIViewRepresentable

2. **Музыка**: AudioPlayerManager использует AVAudioPlayer. Убедитесь что:
   - Файл soundsOfTheForest.mp3 есть в Bundle
   - Настроены audio session permissions (если нужно)

3. **Сохранение настроек**: BreathView сохраняет цвета в UserDefaults. Можно расширить это для других настроек.

## Будущие улучшения

- [ ] Добавить темную/светлую тему
- [ ] Добавить больше настроек для каждой медитации
- [ ] Добавить таймер для сессий
- [ ] Добавить статистику использования
- [ ] Добавить напоминания
- [ ] Добавить больше звуков природы
- [ ] Локализация на другие языки

## Совет

Рекомендуется сначала протестировать на симуляторе, а затем на реальном устройстве для проверки:
- Производительности анимаций
- Качества звука
- Загрузки изображений
- Touch interactions

---

**Создано**: 2026
**Версия**: 2.0
**Фреймворк**: SwiftUI
**Язык**: Swift

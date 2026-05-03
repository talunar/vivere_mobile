# Vivere Mobile 🏃‍♀️

**Vivere** is a modern fitness application built with `Flutter`, designed to track workouts and manage physical activity.

## Tech Stack

*   **State Management**: `flutter_riverpod` + `riverpod_generator` for declarative state handling.
*   **Navigation**: `go_router` for powerful, URL-based declarative routing.
*   **Networking**: `dio` as the primary HTTP client for API communication.
*   **Serialization**: `freezed` and `json_serializable` for type-safe data models and DTOs.
*   **UI/Design**:
    *   **Typography**: `Golos Text` (Regular, Medium, Bold).
    *   **Graphics**: Scalable vector graphics via `flutter_svg`.

## Getting Started

### Prerequisites
*   **Flutter SDK**: `^3.11.3` (as defined in `pubspec.yaml`)[cite: 4].
*   **Dart SDK**: Compatible version included with Flutter.
*   **CocoaPods**: Required for iOS builds.

### Dependency Installation

Clone the repository and run the following command in the root directory to fetch all packages:
```bash
flutter pub get
```

### Code Generation
This project heavily relies on build_runner to generate navigation logic (.g.dart), type-safe models (.freezed.dart), and providers. The project will not compile without this step.
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running the App: 
```Bash
flutter run
```

## Project Resources

* Icons: All vector icons are located in ```assets/icons/```.

* Images & Mocks: UI design assets and placeholders are stored in ```assets/design/```.

# Mini App - Pokémon Browser

# Screenshots Emulator

<p align="center">
  <img src="https://github.com/user-attachments/assets/5ca6c56b-32e7-4097-94ec-c5e2de3fa4ed" width="220"/>
  <img src="https://github.com/user-attachments/assets/efe85523-5f46-467e-ac2f-318cfe321745" width="220"/>
  <img src="https://github.com/user-attachments/assets/1dc3ee0b-2509-4fb4-bb8f-47bf9110e245" width="220"/>
  <img src="https://github.com/user-attachments/assets/4604444d-9b04-4656-b2ed-743349b0e9c5" width="220"/>
</p>


A Flutter application demonstrating clean architecture with BLoC pattern, consuming the [PokéAPI](https://pokeapi.co/) to display Pokémon data.

![Flutter](https://img.shields.io/badge/Flutter-3.6.1-blue)
![Dart](https://img.shields.io/badge/Dart-3.6.0-blue)
![BLoC](https://img.shields.io/badge/State_Management-BLoC-purple)

## 📱 Features

- **Pokémon List**: Browse all Pokémon with infinite scroll pagination
- **Pokémon Details**: View stats, abilities, types, and sprites
- **Pull-to-Refresh**: Refresh the list with pull down gesture
- **Caching**: Images are cached for better performance
- **Type-based Theming**: UI colors adapt to Pokémon type


## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.6.1`
- Dart SDK `^3.6.0`
- A device/emulator to run the app

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd mini-app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate Freezed code** (if models were modified)

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Troubleshooting

If you encounter `MissingPluginException` errors:

```bash
flutter clean
flutter pub get
flutter run
```

## 🧪 Testing

### Run all tests

```bash
flutter test
```

### Run with coverage

```bash
flutter test --coverage
```

### Run specific test file

```bash
flutter test test/widget_test.dart
```

## 📁 Project Structure

This project uses a **layer-based structure** with BLoC pattern:

```
lib/
├── main.dart                    # App entry point
├── bloc/                        # BLoC layer (Business Logic)
│   ├── pokemon_list/
│   │   ├── pokemon_list_bloc.dart
│   │   ├── pokemon_list_event.dart
│   │   └── pokemon_list_state.dart
│   └── pokemon_detail/
│       ├── pokemon_detail_bloc.dart
│       ├── pokemon_detail_event.dart
│       └── pokemon_detail_state.dart
├── models/                      # Data models (Freezed)
│   └── pokemon.dart
├── services/                    # API/Data layer (Dio)
│   └── pokemon_service.dart
├── screens/                     # UI screens
│   ├── home/
│   │   └── home_screen.dart
│   ├── login/
│   │   └── login_screen.dart
│   └── pokemon_detail/
│       └── pokemon_detail_screen.dart
├── widgets/                     # Reusable widgets
│   ├── pokemon_card.dart
│   ├── type_badge.dart
│   ├── stat_bar.dart
│   └── ...
├── router/                      # Navigation (GoRouter)
│   └── app_router.dart
└── theme/                       # App theming
    ├── app_colors.dart
    └── app_theme.dart
```

## 🏗️ Architecture

### BLoC Pattern

This app uses the **BLoC (Business Logic Component)** pattern for state management:

```
┌─────────────────────────────────────────────────────────────────
│                           FLOW
│
│   UI ──(dispatch)──> EVENT ──> BLOC ──> STATE ──(rebuild)──> UI
│                                  │
│                                  ▼
│                              SERVICE
│                                  │
│                                  ▼
│                                API
└─────────────────────────────────────────────────────────────────
```

#### Key Components:

| Component | Purpose                      | Example                                  |
| --------- | ---------------------------- | ---------------------------------------- |
| **Event** | User actions/triggers        | `PokemonListLoad`, `PokemonListLoadMore` |
| **BLoC**  | Process events, manage logic | `PokemonListBloc`                        |
| **State** | Immutable UI state           | `loading`, `loaded`, `error`             |

#### Example Usage:

```dart
// 1. Dispatch event (in initState or on user action)
context.read<PokemonListBloc>().add(const PokemonListEvent.load());

// 2. React to state changes (in build method)
BlocBuilder<PokemonListBloc, PokemonListState>(
  builder: (context, state) {
    return state.when(
      initial: () => Container(),
      loading: () => CircularProgressIndicator(),
      loaded: (pokemon, hasMore, isLoadingMore) => ListView(...),
      error: (message) => Text(message),
    );
  },
)
```

### Alternative Structure: Feature-First

Instead of grouping by type (all BLoCs together), you can organize by **feature**:

```
lib/
├── features/
│   ├── pokemon_list/
│   │   ├── bloc/
│   │   │   ├── pokemon_list_bloc.dart
│   │   │   ├── pokemon_list_event.dart
│   │   │   └── pokemon_list_state.dart
│   │   ├── screens/
│   │   │   └── pokemon_list_screen.dart
│   │   └── widgets/
│   │       └── pokemon_card.dart
│   │
│   ├── pokemon_detail/
│   │   ├── bloc/
│   │   ├── screens/
│   │   └── widgets/
│   │
│   └── auth/
│       ├── bloc/
│       ├── screens/
│       └── widgets/
│
├── core/
│   ├── services/
│   ├── theme/
│   └── router/
│
└── shared/
    └── widgets/
```

**When to use Feature-First:**

- Large applications with many features
- Teams working on different features independently
- Features that may be extracted into packages

**When to use Layer-Based (current):**

- Small to medium applications
- Easier to find all BLoCs, services, etc.
- Simpler mental model for beginners

## 📦 Dependencies

| Package                | Version  | Purpose          |
| ---------------------- | -------- | ---------------- |
| `flutter_bloc`         | ^8.1.6   | State management |
| `dio`                  | ^5.4.3+1 | HTTP client      |
| `freezed_annotation`   | ^2.4.1   | Immutable models |
| `go_router`            | ^16.1.0  | Navigation       |
| `cached_network_image` | ^3.3.1   | Image caching    |

### Dev Dependencies

| Package             | Purpose                    |
| ------------------- | -------------------------- |
| `freezed`           | Code generation for models |
| `json_serializable` | JSON serialization         |
| `build_runner`      | Code generation runner     |

## 🔧 Code Generation

After modifying Freezed models or BLoC states:

```bash
# One-time build
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-rebuild on changes)
dart run build_runner watch --delete-conflicting-outputs
```

## 📝 API Reference

This app uses the [PokéAPI](https://pokeapi.co/):

- **List Pokémon**: `GET https://pokeapi.co/api/v2/pokemon?limit=20&offset=0`
- **Get Pokémon**: `GET https://pokeapi.co/api/v2/pokemon/{id}`

## 📄 License

This project is for technical assessment purposes.

## Flutter Football
Football app made in flutter using football-data api, 

## OPEN-SOURCE LIBRARIES
- [http](https://pub.dev/packages/http)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [intl](https://pub.dev/packages/intl)
- [connectivity_plus](https://pub.dev/packages/connectivity_plus)
- [collection](https://pub.dev/packages/collection)

## Flutter version
>Flutter Flutter 2.2.3
>
>Tools • Dart 2.13.4

## Getting a Football Data API Token

This project uses the Football data to get the latest competitions, matches, and standings data.

Before running the app you need to [sign up on the Football data website](https://www.football-data.org/)

Once you have this, take a look at `constants.dart` file inside `utils/`, and add your API Token:

```dart
// constants.dart
const String API_TOKEN = "Your-API-Token";
```

Congrats, you're good to go. 😎

## How to use it?

```cli
git clone
flutter pub get
flutter run
```

# flutter_template

# Dependencies

- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [intl](https://pub.dev/packages/intl)
- [intl_utils](https://pub.dev/packages/intl_utils)
  - [vscode extension](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)

# Instructions

- `pubspec.yaml`

```yaml
dependencies:
  # localization
  flutter_localizations:
    sdk: flutter
  intl: ^0.17.0
flutter:
  generate: true
flutter_intl:
  enabled: true
```

- `Command + Shift + P` and choose `Flutter Intl: initialize`

  - `Command + Shift + P` and choose `Flutter Intl: Add Locale` to add locale

- `lib/I10n/intl_en.arb`

```json
{
  "@@locale": "en",
  "name": "Rainforest"
}
```

- Usage of package `intl` and `intl_utils`, please refer to [lib/main.dart](lib/main.dart)
- locale info is saved by `shared_preferences`,
  - you can access it by
  ```dart
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getStringList('locale');
  // e.g. ['zh', 'TW']
  ```
  - and set it by
  ```dart
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setStringList(
      'locale',
      [locale.languageCode, locale.countryCode]
          .whereType<String>()
          .toList());
  ```

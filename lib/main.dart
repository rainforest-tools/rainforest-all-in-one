import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AdaptiveTheme.getThemeMode(),
        builder:
            (BuildContext context, AsyncSnapshot<AdaptiveThemeMode?> snapshot) {
          return AdaptiveTheme(
              light: ThemeData.light(),
              dark: ThemeData.dark(),
              initial: snapshot.data ?? AdaptiveThemeMode.system,
              builder: (ThemeData theme, ThemeData darkTheme) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: theme,
                  darkTheme: darkTheme,
                  home: const Home(),
                );
              });
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/generated/l10n.dart';
import 'package:flutter_template/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _defaultLocale;

  @override
  void initState() {
    super.initState();
    _checkDefaultLocale();
  }

  Future<void> _checkDefaultLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final localeString = prefs.getStringList('locale');
    if (localeString != null && localeString.isNotEmpty) {
      _defaultLocale = Locale(
          localeString.first, localeString.length > 1 ? localeString[1] : null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(
        setLocale: (locale) async {
          await S.load(locale);
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          _prefs.setStringList(
              'locale',
              [locale.languageCode, locale.countryCode]
                  .whereType<String>()
                  .toList());
          // refresh
          setState(() {});
        },
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _defaultLocale,
    );
  }
}

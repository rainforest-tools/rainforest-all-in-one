import 'package:flutter/material.dart';
import 'package:flutter_template/generated/l10n.dart';

class Home extends StatelessWidget {
  final Future<void> Function(Locale)? setLocale;
  const Home({Key? key, this.setLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(S.of(context).name),
            DropdownButton<Locale>(
                value: Localizations.localeOf(context),
                items: S.delegate.supportedLocales
                    .map((locale) => DropdownMenuItem<Locale>(
                          value: locale,
                          child: Text(locale.toLanguageTag().toUpperCase()),
                        ))
                    .toList(),
                onChanged: (locale) async {
                  if (locale != null) {
                    setLocale?.call(locale);
                  }
                }),
          ],
        ),
      ),
    );
  }
}

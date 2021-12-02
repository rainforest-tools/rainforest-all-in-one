import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Icon(Icons.nights_stay_outlined),
            onPressed: () => AdaptiveTheme.of(context).setDark(),
          ),
          ElevatedButton(
            child: const Icon(Icons.wb_sunny_outlined),
            onPressed: () => AdaptiveTheme.of(context).setLight(),
          ),
          ElevatedButton(
            child: const Icon(Icons.auto_fix_high),
            onPressed: () => AdaptiveTheme.of(context).setSystem(),
          )
        ],
      )),
    );
  }
}

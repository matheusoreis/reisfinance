import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reisfinance/app/config/theme.dart';
import 'package:reisfinance/app/ui/pages/home/page.dart';
import 'package:reisfinance/app/ui/pages/intro/page.dart';
import 'package:reisfinance/app/ui/pages/splash/page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    final TextTheme baseTextTheme = Theme.of(context).textTheme;

    TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
      "Poppins",
      baseTextTheme,
    );

    final TextTheme displayTextTheme = GoogleFonts.getTextTheme(
      "Poppins",
      baseTextTheme,
    );

    final MaterialTheme theme = MaterialTheme(
      displayTextTheme.copyWith(
        bodyLarge: bodyTextTheme.bodyLarge,
        bodyMedium: bodyTextTheme.bodyMedium,
        bodySmall: bodyTextTheme.bodySmall,
        labelLarge: bodyTextTheme.labelLarge,
        labelMedium: bodyTextTheme.labelMedium,
        labelSmall: bodyTextTheme.labelSmall,
      ),
    );

    return MaterialApp(
      title: 'Reis Finance',
      theme: theme.light(),
      routes: {
        '/': (context) => SplashPage(),
        '/intro': (context) => IntroPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

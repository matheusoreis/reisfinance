import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/config/theme.dart';
import 'package:reisfinance/app/pages/config_page.dart';
import 'package:reisfinance/app/pages/home_page.dart';
import 'package:reisfinance/app/pages/intro_page.dart';
import 'package:reisfinance/app/pages/splash_page.dart';
import 'package:reisfinance/app/stores/theme_store.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ThemeStore themeStore = dependency.get<ThemeStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme baseTextTheme = Theme.of(context).textTheme;

    final TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
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

    return ListenableBuilder(
      listenable: themeStore,
      builder: (context, _) {
        return MaterialApp(
          title: 'Reis Finance',
          themeMode: themeStore.themeMode,
          theme: theme.light(),
          darkTheme: theme.dark(),
          locale: const Locale('pt', 'BR'),
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('en', 'US'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routes: {
            '/': (context) => SplashPage(),
            '/intro': (context) => IntroPage(),
            '/home': (context) => HomePage(),
            '/config': (context) => ConfigPage(),
          },
        );
      },
    );
  }
}

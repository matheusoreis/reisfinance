import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/config/theme.dart';
import 'package:reisfinance/app/store.dart';
import 'package:reisfinance/app/ui/pages/home/page.dart';
import 'package:reisfinance/app/ui/pages/intro/page.dart';
import 'package:reisfinance/app/ui/pages/splash/page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppStore store = dependency.get<AppStore>();

  @override
  Widget build(BuildContext context) {
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

    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        return MaterialApp(
          title: 'Reis Finance',
          themeMode: store.themeMode,
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
          },
        );
      },
    );
  }
}

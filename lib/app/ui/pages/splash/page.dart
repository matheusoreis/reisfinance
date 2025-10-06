import 'package:flutter/material.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/ui/pages/splash/store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashPageStore store = dependency.get<SplashPageStore>();

  @override
  void initState() {
    super.initState();
    store.start(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

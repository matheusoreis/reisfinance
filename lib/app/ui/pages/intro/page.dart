import 'package:flutter/material.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/ui/components/button.dart';
import 'package:reisfinance/app/ui/pages/intro/store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final IntroPageStore store = dependency.get<IntroPageStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          padding: EdgeInsets.all(context.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Text("asd"),
              ),
              Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: EdgeInsets.all(context.padding * 2),
                  child: Row(
                    spacing: context.padding,
                    children: [
                      Expanded(
                        child: Text(
                          "Acessar o sistema agora mesmo!",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                      MyButton(
                        label: "Pular",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

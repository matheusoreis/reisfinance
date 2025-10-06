import 'package:flutter/material.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/ui/components/button.dart';
import 'package:reisfinance/app/ui/components/page_indicator.dart';
import 'package:reisfinance/app/ui/pages/intro/store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';
import 'package:reisfinance/app/utils/functions/color.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final IntroPageStore store = dependency.get<IntroPageStore>();
  final PageController controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    store.getIntros();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: store.intros,
          builder: (_, intros, __) {
            if (intros.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Container(
              width: context.screenWidth,
              height: context.screenHeight,
              padding: EdgeInsets.all(context.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      itemCount: intros.length,
                      onPageChanged: (index) {
                        setState(() => currentPage = index);
                      },
                      itemBuilder: (_, index) {
                        final intro = intros[index];
                        return SizedBox(
                          width: context.screenWidth,
                          child: Card(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHigh,
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.all(context.padding * 2),
                              child: SingleChildScrollView(
                                child: Text(
                                  intro.message,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                        height: 1.2,
                                        fontSize: 48,
                                      ),
                                  textWidthBasis: TextWidthBasis.parent,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  PageIndicator(
                    count: intros.length,
                    currentIndex: currentPage,
                  ),

                  const SizedBox(height: 16),

                  Card(
                    color: colorByTheme(
                      context,
                      light: Theme.of(context).colorScheme.primary,
                      dark: Theme.of(context).colorScheme.tertiary,
                    ),
                    elevation: 0,
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
                            label: currentPage == intros.length - 1
                                ? "Acessar"
                                : "Próximo",
                            color: colorByTheme(
                              context,
                              light: Theme.of(context).colorScheme.tertiary,
                              dark: Theme.of(context).colorScheme.primary,
                            ),
                            textColor: Theme.of(context).colorScheme.onSurface,
                            onPressed: () {
                              if (currentPage == intros.length - 1) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/home',
                                );
                              } else {
                                controller.animateToPage(
                                  intros.length - 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

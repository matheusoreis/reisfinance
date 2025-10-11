import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/pages/components/page_indicator.dart';
import 'package:reisfinance/app/pages/components/primary_card.dart';
import 'package:reisfinance/app/pages/components/surface_card.dart';
import 'package:reisfinance/app/pages/components/themed_button.dart';
import 'package:reisfinance/app/stores/intro_store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final IntroStore store = dependency.get<IntroStore>();
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
                spacing: context.padding,
                children: [
                  // conteúdo das páginas
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      itemCount: intros.length,
                      onPageChanged: (index) {
                        setState(() => currentPage = index);
                      },
                      itemBuilder: (_, index) {
                        final intro = intros[index];
                        return _IntroMessageCard(message: intro.message);
                      },
                    ),
                  ),

                  // indicador de páginas
                  PageIndicator(
                    count: intros.length,
                    currentIndex: currentPage,
                  ),

                  // card com botão de ação
                  _IntroActionCard(
                    isLast: currentPage == intros.length - 1,
                    onNext: () {
                      if (currentPage == intros.length - 1) {
                        Navigator.pushReplacementNamed(context, '/home');
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
            );
          },
        ),
      ),
    );
  }
}

class _IntroMessageCard extends StatelessWidget {
  final String message;
  const _IntroMessageCard({required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: SurfaceCard(
        padding: EdgeInsets.all(context.padding * 2),
        child: SingleChildScrollView(
          child: Text(
            message,
            softWrap: true,
            overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              height: 1.2,
              fontSize: 48,
            ),
            textWidthBasis: TextWidthBasis.parent,
          ),
        ),
      ),
    );
  }
}

class _IntroActionCard extends StatelessWidget {
  final bool isLast;
  final VoidCallback onNext;

  const _IntroActionCard({
    required this.isLast,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      padding: EdgeInsets.all(context.padding * 2),
      child: Row(
        spacing: context.padding,
        children: [
          Expanded(
            child: Text(
              "Acessar o sistema",
              overflow: TextOverflow.visible,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          ThemedButton(
            label: isLast ? "Acessar" : "Próximo",
            prefixIcon: isLast
                ? TablerIcons.door_enter
                : TablerIcons.chevron_right,
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}

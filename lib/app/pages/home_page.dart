import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/pages/components/my_button.dart';
import 'package:reisfinance/app/pages/components/primary_card.dart';
import 'package:reisfinance/app/pages/components/surface_card.dart';
import 'package:reisfinance/app/stores/home_store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';
import 'package:reisfinance/app/utils/functions/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = dependency.get<HomeStore>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      key: scaffoldKey,

      drawer: HomeDrawer(),
      endDrawer: const HomeEndDrawer(),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: Container(
            height: kToolbarHeight,
            color: colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PillButton(
                  icon: TablerIcons.burger,
                  onPressed: () => scaffoldKey.currentState?.openDrawer(),
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                PillButton(
                  icon: TablerIcons.filter,
                  onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(context.padding),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.radius),
          ),
          child: Column(
            children: const [
              _HomeSummaryCard(),
              _HomeMainCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeSummaryCard extends StatelessWidget {
  const _HomeSummaryCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight / 1.8,
      child: const SurfaceCard(
        child: Center(
          child: Text(
            'Resumo ou gráfico aqui',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class _HomeMainCard extends StatelessWidget {
  const _HomeMainCard();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: context.screenWidth,
        child: const PrimaryCard(
          child: Center(
            child: Text(
              'Conteúdo principal',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class PillButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const PillButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 50,
      width: 82,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(40),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 22, color: colorScheme.onSurface),
        padding: EdgeInsets.zero,
        splashRadius: 22,
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});
  final colorSchemeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      key: colorSchemeKey,
      backgroundColor: colorScheme.surfaceContainerHighest,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: context.screenWidth,
                child: MyButton(
                  label: "Home",
                  color: colorByTheme(
                    context,
                    light: Theme.of(context).colorScheme.tertiary,
                    dark: Theme.of(context).colorScheme.primary,
                  ),
                  textColor: Theme.of(context).colorScheme.onSurface,
                  prefixIcon: TablerIcons.home,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeEndDrawer extends StatelessWidget {
  const HomeEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: colorScheme.surfaceContainerHighest,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: context.screenWidth,
                child: MyButton(
                  label: "Aplicar Filtro",
                  color: colorByTheme(
                    context,
                    light: Theme.of(context).colorScheme.tertiary,
                    dark: Theme.of(context).colorScheme.primary,
                  ),
                  textColor: Theme.of(context).colorScheme.onSurface,
                  prefixIcon: TablerIcons.check,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

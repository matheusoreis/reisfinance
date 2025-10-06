import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/ui/pages/home/store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';
import 'package:reisfinance/app/utils/functions/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore store = dependency.get<HomePageStore>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        backgroundColor: colorScheme.surfaceContainerHighest,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Início'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Finanças'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
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
                _buildPillButton(
                  context,
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
                _buildPillButton(
                  context,
                  icon: TablerIcons.filter,
                  onPressed: () {
                    store.toggleTheme();
                  },
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
            top: Radius.circular(context.borderRadius),
          ),
          child: SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
            child: Column(
              children: [
                SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight / 1.8,
                  child: Card(
                    color: colorScheme.surfaceContainerHigh,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: context.screenWidth,
                    child: Card(
                      color: colorByTheme(
                        context,
                        light: colorScheme.primary,
                        dark: colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPillButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
  }) {
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

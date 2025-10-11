import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:reisfinance/app/pages/components/themed_button.dart';
import 'package:reisfinance/app/pages/home/store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';

class HomeDrawer extends StatelessWidget {
  final HomeStore store;

  HomeDrawer({super.key, required this.store});

  final colorSchemeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final brightness = Theme.of(context).brightness;

    return Drawer(
      key: colorSchemeKey,
      backgroundColor: colorScheme.surfaceContainerHighest,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: context.padding,
            children: [
              SizedBox(
                width: context.screenWidth,
                height: context.buttonHeight,
                child: ThemedButton(
                  label: "Home",
                  prefixIcon: TablerIcons.home,
                  onPressed: () => Scaffold.of(context).closeDrawer(),
                ),
              ),
              SizedBox(
                width: context.screenWidth,
                height: context.buttonHeight,
                child: ThemedButton(
                  label: "Mudar Tema",
                  prefixIcon: brightness == Brightness.light
                      ? TablerIcons.moon
                      : TablerIcons.sun,
                  onPressed: () async {
                    await store.toggleTheme();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

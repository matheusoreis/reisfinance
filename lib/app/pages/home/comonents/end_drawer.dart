import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:reisfinance/app/domain/dtos/balance_card.dart';
import 'package:reisfinance/app/pages/components/themed_button.dart';
import 'package:reisfinance/app/pages/home/store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';
import 'package:reisfinance/app/utils/functions/color.dart';

class HomeEndDrawer extends StatelessWidget {
  final HomeStore store;

  const HomeEndDrawer({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedPeriod = ValueNotifier<BalancePeriod>(store.period.value);

    return Drawer(
      backgroundColor: colorScheme.surfaceContainerHighest,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(context.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: context.padding,
            children: [
              const Text(
                'Selecionar período',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              ValueListenableBuilder<BalancePeriod>(
                valueListenable: selectedPeriod,
                builder: (_, value, __) {
                  return Wrap(
                    spacing: context.padding,
                    children: BalancePeriod.values.map((period) {
                      return ChoiceChip(
                        label: Text(period.label),
                        selectedColor: colorByTheme(
                          context,
                          light: Theme.of(context).colorScheme.tertiary,
                          dark: Theme.of(context).colorScheme.primary,
                        ),
                        side: BorderSide.none,
                        selected: value == period,
                        onSelected: (_) => selectedPeriod.value = period,
                      );
                    }).toList(),
                  );
                },
              ),

              const Spacer(),

              SizedBox(
                width: context.screenWidth,
                height: context.buttonHeight,
                child: ThemedButton(
                  label: "Aplicar",
                  prefixIcon: TablerIcons.check,
                  onPressed: () {
                    store.setPeriod(selectedPeriod.value);
                    Navigator.pop(context);
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

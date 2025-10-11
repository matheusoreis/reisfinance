import 'package:flutter/material.dart';
import 'package:reisfinance/app/domain/dtos/balance_card.dart';
import 'package:reisfinance/app/pages/components/primary_card.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';

class BalanceCard extends StatelessWidget {
  final BalanceDto balance;

  const BalanceCard({super.key, required this.balance});

  String get previousPeriodLabel {
    switch (balance.period) {
      case BalancePeriod.day:
        return 'de ontem';
      case BalancePeriod.week:
        return 'de semana passada';
      case BalancePeriod.month:
        return 'do mês passado';
      case BalancePeriod.year:
        return 'do ano passado';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SizedBox(
      width: context.screenWidth,
      height: 180,
      child: PrimaryCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Esse ${balance.period.label}',
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.surface,
              ),
            ),
            Text(
              'R\$ ${balance.value.toStringAsFixed(2)}',
              style: textTheme.displayMedium!.copyWith(
                color: colorScheme.surface,
              ),
            ),
            Text(
              'Em comparação com R\$ ${balance.previousValue.toStringAsFixed(2)} $previousPeriodLabel.',
              style: textTheme.bodySmall!.copyWith(
                color: colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

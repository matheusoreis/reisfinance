enum BalancePeriod {
  day('dia'),
  week('semana'),
  month('mês'),
  year('ano');

  final String label;
  const BalancePeriod(this.label);
}

class BalanceDto {
  final double value;
  final double previousValue;
  final BalancePeriod period;

  const BalanceDto({
    required this.value,
    required this.previousValue,
    required this.period,
  });

  double get difference {
    return value - previousValue;
  }

  double get percentageChange {
    return previousValue == 0
        ? 0
        : ((value - previousValue) / previousValue) * 100;
  }
}

import 'package:flutter/material.dart';
import 'package:reisfinance/app/domain/dtos/balance_card.dart';
import 'package:reisfinance/app/stores/theme_store.dart';

class HomeStore {
  final ThemeStore themeStore;

  HomeStore({required this.themeStore});

  final period = ValueNotifier<BalancePeriod>(BalancePeriod.month);

  void setPeriod(BalancePeriod newPeriod) {
    period.value = newPeriod;
  }

  Future<void> toggleTheme() async {
    await themeStore.toggleTheme();
  }
}

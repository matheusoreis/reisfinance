import 'package:flutter/material.dart';
import 'package:reisfinance/app/data/repositories/theme.dart';
import 'package:reisfinance/app/domain/entities/theme.dart';

class ThemeStore extends ChangeNotifier {
  final ThemeRepository repository;

  ThemeStore({required this.repository});

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  Future<void> loadTheme() async {
    final result = await repository.getTheme();

    result.fold(
      (entity) => _themeMode = entity.mode,
      (_) => _themeMode = ThemeMode.system,
    );

    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final newMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    _themeMode = newMode;
    await repository.saveTheme(ThemeEntity(mode: newMode));
    notifyListeners();
  }

  Future<void> setTheme(ThemeMode mode) async {
    _themeMode = mode;
    await repository.saveTheme(ThemeEntity(mode: mode));
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:reisfinance/app/data/services/storage.dart';
import 'package:reisfinance/app/domain/entities/theme.dart';
import 'package:result_dart/result_dart.dart';

class ThemeRepository {
  final StorageService storage;

  static const _key = 'theme_mode';

  ThemeRepository({required this.storage});

  AsyncResult<ThemeEntity> getTheme() async {
    final result = await storage.getData(_key);

    return result.fold(
      (value) {
        final mode = ThemeMode.values.firstWhere(
          (m) => m.name == value,
          orElse: () => ThemeMode.system,
        );

        return Success(ThemeEntity(mode: mode));
      },
      (failure) => Success(ThemeEntity(mode: ThemeMode.system)),
    );
  }

  AsyncResult<Unit> saveTheme(ThemeEntity entity) async {
    final result = await storage.saveData(_key, entity.mode.name);

    return result.fold(
      (_) => Success.unit(),
      (failure) => Failure(failure),
    );
  }
}

import 'package:flutter/material.dart';

class ThemeEntity {
  final ThemeMode mode;

  ThemeEntity({required this.mode});

  factory ThemeEntity.fromMap(Map<String, dynamic> json) {
    final value = json['mode'] ?? 'system';
    return ThemeEntity(
      mode: ThemeMode.values.firstWhere(
        (e) => e.name == value,
        orElse: () => ThemeMode.system,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {'mode': mode.name};
  }
}

import 'package:flutter/material.dart';
import 'package:reisfinance/app/data/repositories/intro.dart';
import 'package:reisfinance/app/domain/entities/intro.dart';

class IntroStore {
  final IntroRepository repository;

  IntroStore({required this.repository});

  final ValueNotifier<List<IntroEntity>> intros = ValueNotifier([]);

  Future<void> getIntros() async {
    try {
      final data = await repository.getAllIntros();
      intros.value = data;
    } catch (e) {
      intros.value = [];
    }
  }

  void dispose() {
    intros.dispose();
  }
}

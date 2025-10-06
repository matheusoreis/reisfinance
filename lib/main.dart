import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:reisfinance/app/app.dart';
import 'package:reisfinance/app/domain/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('pt_BR');

  final Dependencies dependencies = Dependencies();
  dependencies.setup();

  runApp(const App());
}

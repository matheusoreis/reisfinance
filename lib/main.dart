import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:reisfinance/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('pt_BR');

  runApp(const App());
}

import 'package:reisfinance/app/store.dart';

class HomePageStore {
  final AppStore appStore;

  HomePageStore({required this.appStore});

  void toggleTheme() {
    appStore.toggle();
  }
}

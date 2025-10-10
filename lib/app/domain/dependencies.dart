import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/data/repositories/home.dart';
import 'package:reisfinance/app/data/repositories/intro.dart';
import 'package:reisfinance/app/data/repositories/theme.dart';
import 'package:reisfinance/app/data/services/storage.dart';
import 'package:reisfinance/app/stores/config_store.dart';
import 'package:reisfinance/app/store.dart';
import 'package:reisfinance/app/stores/home_store.dart';
import 'package:reisfinance/app/stores/intro_store.dart';
import 'package:reisfinance/app/stores/splash_store.dart';
import 'package:reisfinance/app/stores/theme_store.dart';

class Dependencies {
  void setup() {
    appSetup();
    splashSetup();
    introSetup();
    homeSetup();
  }

  void appSetup() {
    dependency.registerSingleton<StorageService>(
      StorageService(),
    );

    dependency.registerSingleton<ThemeRepository>(
      ThemeRepository(
        storage: dependency.get<StorageService>(),
      ),
    );

    dependency.registerSingleton(
      ThemeStore(
        repository: dependency.get<ThemeRepository>(),
      ),
    );

    dependency.registerSingleton<AppStore>(
      AppStore(),
    );
  }

  void splashSetup() {
    dependency.registerSingleton<SplashStore>(
      SplashStore(),
    );
  }

  void introSetup() {
    dependency.registerFactory<IntroRepository>(
      () => IntroRepository(),
    );

    dependency.registerSingleton<IntroStore>(
      IntroStore(
        repository: dependency.get<IntroRepository>(),
      ),
    );
  }

  void homeSetup() {
    dependency.registerFactory<HomeRepository>(
      () => HomeRepository(),
    );

    dependency.registerSingleton<HomeStore>(
      HomeStore(),
    );
  }

  void configSetup() {
    dependency.registerFactory<ConfigStore>(
      () => ConfigStore(),
    );
  }
}

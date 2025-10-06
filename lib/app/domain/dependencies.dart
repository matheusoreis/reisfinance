import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/data/repositories/home.dart';
import 'package:reisfinance/app/data/repositories/intro.dart';
import 'package:reisfinance/app/store.dart';
import 'package:reisfinance/app/ui/pages/home/store.dart';
import 'package:reisfinance/app/ui/pages/intro/store.dart';
import 'package:reisfinance/app/ui/pages/splash/store.dart';

class Dependencies {
  void setup() {
    dependency.registerLazySingleton<AppStore>(() => AppStore());

    splashSetup();
    introSetup();
    homeSetup();
  }

  void splashSetup() {
    dependency.registerFactory<SplashPageStore>(() => SplashPageStore());
  }

  void introSetup() {
    dependency.registerFactory<IntroRepository>(
      () => IntroRepository(),
    );
    dependency.registerFactory<IntroPageStore>(
      () => IntroPageStore(repository: dependency.get<IntroRepository>()),
    );
  }

  void homeSetup() {
    dependency.registerFactory<HomeRepository>(
      () => HomeRepository(),
    );
    dependency.registerFactory<HomePageStore>(
      () => HomePageStore(appStore: dependency.get<AppStore>()),
    );
  }
}

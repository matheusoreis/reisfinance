import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/ui/pages/intro/store.dart';
import 'package:reisfinance/app/ui/pages/splash/store.dart';

class Dependencies {
  void setup() {
    splashSetup();
    introSetup();
    homeSetup();
  }

  void splashSetup() {
    dependency.registerFactory<SplashPageStore>(() => SplashPageStore());
  }

  void introSetup() {
    dependency.registerFactory<IntroPageStore>(() => IntroPageStore());
  }

  void homeSetup() {}
}

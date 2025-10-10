import 'package:reisfinance/app/domain/entities/intro.dart';

class IntroRepository {
  Future<List<IntroEntity>> getAllIntros() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    return [
      IntroEntity(
        message:
            'Com a Reis, você assume o controle da sua vida financeira de forma simples, rápida e intuitiva.',
      ),
      IntroEntity(
        message:
            'Acompanhe seus gastos, trace metas financeiras inteligentes e veja seu progresso.',
      ),
      IntroEntity(
        message:
            'Tenha controle total das suas finanças, no seu ritmo e do seu jeito em um só lugar.',
      ),
    ];
  }
}

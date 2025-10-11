import 'package:flutter/material.dart';
import 'package:reisfinance/app/pages/components/surface_card.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';

class HomeSummaryCard extends StatelessWidget {
  const HomeSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final year = DateTime.now().year;
    final data = _generateData();

    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight / 1.6,
      child: SurfaceCard(
        child: Padding(
          padding: EdgeInsets.all(context.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ano $year',
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              // Usa LayoutBuilder pra medir a altura disponível
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxBarHeight =
                        constraints.maxHeight *
                        0.8; // usa 80% da área disponível
                    final maxValue = data
                        .map((e) => e.value)
                        .reduce((a, b) => a > b ? a : b);

                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: data.map((e) {
                            final barHeight =
                                (e.value / maxValue) * maxBarHeight;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeOut,
                                    height: barHeight,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      color: colorScheme.tertiary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    e.label,
                                    style: textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<_BarData> _generateData() {
    final labels = [
      'JAN',
      'FEV',
      'MAR',
      'ABR',
      'MAI',
      'JUN',
      'JUL',
      'AGO',
      'SET',
      'OUT',
      'NOV',
      'DEZ',
    ];

    final values = [20, 40, 30, 60, 100, 80, 70, 50, 100, 30, 10, 0];

    return List.generate(
      12,
      (i) => _BarData(label: labels[i], value: values[i].toDouble()),
    );
  }
}

class _BarData {
  final String label;
  final double value;
  _BarData({required this.label, required this.value});
}

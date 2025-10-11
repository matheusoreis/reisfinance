import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:reisfinance/app/config/dependencies.dart';
import 'package:reisfinance/app/domain/dtos/balance_card.dart';
import 'package:reisfinance/app/pages/home/comonents/balance_card.dart';
import 'package:reisfinance/app/pages/home/comonents/end_drawer.dart';
import 'package:reisfinance/app/pages/home/comonents/home_drawer.dart';
import 'package:reisfinance/app/pages/home/comonents/sumary_card.dart';
import 'package:reisfinance/app/pages/home/store.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = dependency.get<HomeStore>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      key: scaffoldKey,

      drawer: HomeDrawer(
        store: store,
      ),
      endDrawer: HomeEndDrawer(
        store: store,
      ),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SafeArea(
          child: Container(
            height: kToolbarHeight,
            color: colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PillButton(
                  icon: TablerIcons.burger,
                  onPressed: () => scaffoldKey.currentState?.openDrawer(),
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                PillButton(
                  icon: TablerIcons.filter,
                  onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(context.padding),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.radius),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: context.screenWidth,
              height: context.screenHeight,
              child: Column(
                children: [
                  ValueListenableBuilder<BalancePeriod>(
                    valueListenable: store.period,
                    builder: (_, period, __) {
                      return HomeSummaryCard();
                    },
                  ),

                  ValueListenableBuilder<BalancePeriod>(
                    valueListenable: store.period,
                    builder: (context, period, _) {
                      return BalanceCard(
                        balance: BalanceDto(
                          value: 1000,
                          previousValue: 800,
                          period: period,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PillButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const PillButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: 50,
      width: 82,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(40),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 22, color: colorScheme.onSurface),
        padding: EdgeInsets.zero,
        splashRadius: 22,
      ),
    );
  }
}

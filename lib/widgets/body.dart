import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../screens/homescreen.dart';
import '../utils/two_panel.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: VsyncProvider(context),
        child: const _BodyContent(),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = AnimationController(
      vsync: Provider.of<VsyncProvider>(context, listen: false).vsync,
      duration: const Duration(milliseconds: 100),
      value: -1.0,
    );

    return TwoPanels(controller: controller, z: z);
  }
}

class VsyncProvider extends TickerProvider {
  final BuildContext context;

  VsyncProvider(this.context);

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);

  TickerProvider get vsync => this;
}

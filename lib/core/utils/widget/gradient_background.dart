import 'package:flutter/widgets.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 4, 44, 78),
          Color.fromARGB(255, 0, 66, 121),
          Color.fromARGB(255, 0, 100, 182),
        ], begin: Alignment.center, end: Alignment.bottomCenter)),
        child: child);
  }
}

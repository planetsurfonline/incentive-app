import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.grey.shade700,
            BlendMode.multiply,
          ),
          child: Image.asset(
            'assets/images/landing.jpeg',
            fit: BoxFit.cover,
            alignment: const Alignment(0, -0.3),
          ),
        ),
        const Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}

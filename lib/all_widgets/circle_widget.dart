import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gulu_vpn/main.dart';

class CircleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget iconWidget;

  const CircleWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.4,
      child: Column(
        children: [
          iconWidget,
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

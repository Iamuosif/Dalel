import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor, // Match your theme
        shape: const CircleBorder(),
        child: const Icon(Icons.shopping_cart_outlined,
            color: Colors.white, size: 28),
      ),
    );
  }
}

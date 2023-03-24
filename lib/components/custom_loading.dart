import '../_exports.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final MapBoxController controller;
  const CustomLoading({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.isLoading,
      builder: (context, value, child) => value
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox.shrink(),
    );
  }
}

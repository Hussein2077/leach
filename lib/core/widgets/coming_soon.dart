import 'package:flutter/material.dart';
import 'package:leach/core/widgets/cutom_text.dart';
class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: CustomText(text: 'Coming soon!')), // 替换为你的内容
    );
  }
}

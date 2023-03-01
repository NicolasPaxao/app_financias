import 'package:flutter/material.dart';

class AnimatedAppBarTitleWidget extends StatelessWidget {
  const AnimatedAppBarTitleWidget({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedAlign(
        alignment: pageIndex == 0 ? Alignment.centerLeft : Alignment.center,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        child: const Text(
          'HG Finance',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedLeadingWidget extends StatelessWidget {
  const AnimatedLeadingWidget({
    Key? key,
    required this.pageIndex,
    required this.onTap,
  }) : super(key: key);

  final int pageIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState:
          pageIndex == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: const Icon(
        Icons.monetization_on,
        size: 36,
        color: Colors.white,
      ),
      secondChild: IconButton(
        onPressed: onTap,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}

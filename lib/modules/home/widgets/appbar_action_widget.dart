import 'package:flutter/material.dart';

class AnimatedActionButton extends StatelessWidget {
  const AnimatedActionButton({
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
      firstChild: TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        onPressed: onTap,
        icon: const Icon(Icons.swap_horiz),
        label: const Text('Converter'),
      ),
      secondChild: const IconButton(onPressed: null, icon: SizedBox.expand()),
    );
  }
}

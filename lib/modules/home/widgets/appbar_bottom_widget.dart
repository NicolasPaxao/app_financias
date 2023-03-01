import 'package:flutter/material.dart';

class AppBarBottomWidget extends StatefulWidget {
  const AppBarBottomWidget({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<AppBarBottomWidget> createState() => _AppBarBottomWidgetState();
}

class _AppBarBottomWidgetState extends State<AppBarBottomWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
      firstChild: widget.pageIndex == 0
          ? TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              controller: tabController,
              tabs: const [
                Tab(text: 'Moedas'),
                Tab(text: 'Corretoras'),
                Tab(text: 'Bitcoin'),
                Tab(text: 'Taxas'),
              ],
            )
          : const SizedBox(),
      crossFadeState: widget.pageIndex == 0
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      secondChild: const SizedBox(),
    );
  }
}

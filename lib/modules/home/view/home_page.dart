// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/finance_controller.dart';
import '../widgets/appbar_action_widget.dart';
import '../widgets/appbar_bottom_widget.dart';
import '../widgets/appbar_leading_widget.dart';
import '../widgets/appbar_title_widget.dart';
import '../partials/home_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          GetBuilder<FinanceController>(
            init: FinanceController(),
            builder: (controller) {
              return AnimatedContainer(
                height: controller.pageIndex.value == 0 ? 135 : 80,
                width: double.infinity,
                duration: const Duration(milliseconds: 250),
                child: Card(
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  color: Colors.black,
                  shadowColor: Colors.black,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AnimatedLeadingWidget(
                              pageIndex: controller.pageIndex.value,
                              onTap: () {
                                controller.pageNavigation(0);
                              },
                            ),
                            const SizedBox(width: 18),
                            AnimatedAppBarTitleWidget(
                              pageIndex: controller.pageIndex.value,
                            ),
                            AnimatedActionButton(
                              pageIndex: controller.pageIndex.value,
                              onTap: () {
                                controller.pageNavigation(1);
                              },
                            )
                          ],
                        ),
                        AppBarBottomWidget(
                          pageIndex: controller.pageIndex.value,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: GetBuilder<FinanceController>(
              init: FinanceController(),
              builder: (controller) {
                return PageView(
                  controller: controller.pageController,
                  children: [
                    const HomeInfoPage(),
                    Column(
                      children: const [
                        Text('data'),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

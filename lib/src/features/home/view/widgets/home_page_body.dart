import 'package:flutter/material.dart';
import 'package:timeline_manager/src/features/home/view/widgets/menu_items_widget.dart';
import 'package:timeline_manager/src/features/home/view/widgets/time_duration_widget.dart';
import 'package:timeline_manager/src/features/home/view/widgets/user_card_widget.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            UserCardWidget(),
            SizedBox(height: 20),
            TimeDurationWidget(),
            SizedBox(height: 20),
            MenuItemsWidget(),
          ],
        ),
      ),
    );
  }
}

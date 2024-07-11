import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/extensions/date_time_extension.dart';
import 'package:timeline_manager/src/features/timeline/view/widgets/date_and_button_row_widget.dart';
import 'package:timeline_manager/src/features/timeline/view/widgets/horizontal_date_list_view.dart';
import 'package:timeline_manager/src/features/timeline/view/widgets/timeline_list_widget.dart';

class TimelineBody extends StatelessWidget {
  const TimelineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DateAndButtonRowWidget(
            dateText: DateTime.now().formatCurrentDateInBengaliToDMMMM,
            buttonText: "নতুন যোগ করুন",
            onButtonPressed: (){},
          ),
          const SizedBox(height: 20),
          const HorizontalDateListView(),
          const SizedBox(height: 20),
          const TimelineListWidget(),
        ],
      ),
    );
  }
}

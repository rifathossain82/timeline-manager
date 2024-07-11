import 'package:flutter/material.dart';
import 'package:timeline_manager/src/features/timeline/view/widgets/timeline_app_bar.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TimelineAppBar(),
      body: Container(),
    );
  }
}

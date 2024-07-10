import 'package:flutter/material.dart';
import 'package:timeline_manager/src/features/home/view/widgets/home_app_bar.dart';
import 'package:timeline_manager/src/features/home/view/widgets/home_page_body.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomepageBody(),
    );
  }
}

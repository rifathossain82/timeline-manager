import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.16),
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AssetPath.person,
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "মোঃ মোহাইমেনুল রেজা",
                  style: context.titleLarge(),
                ),
                const SizedBox(height: 8),
                Text(
                  "সফটবিডি লিমিটেড",
                  style: context.bodyLarge(),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetPath.locationIcon,
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "ঢাকা",
                      style: context.bodyLarge(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
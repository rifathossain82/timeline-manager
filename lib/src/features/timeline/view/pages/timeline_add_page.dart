import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/fake_data/fake_data.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';
import 'package:timeline_manager/src/core/widgets/k_blank_field_builder_with_title.dart';
import 'package:timeline_manager/src/core/widgets/k_drop_down_field_builder_with_title.dart';
import 'package:timeline_manager/src/core/widgets/k_text_form_field_builder_with_title.dart';

class TimelineAddPage extends StatelessWidget {
  const TimelineAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "নতুন যোগ করুন",
          style: context.titleMedium(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: const _TimelineForm(),
    );
  }
}

class _TimelineForm extends StatefulWidget {
  const _TimelineForm();

  @override
  State<_TimelineForm> createState() => _TimelineFormState();
}

class _TimelineFormState extends State<_TimelineForm> {
  late final TextEditingController _paragraphTextController;
  late final TextEditingController _paragraphDescriptionTextController;
  String? _selectedParagraphCategory;
  String? _selectedPlace;

  final GlobalKey<FormState> _timelineFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _paragraphTextController = TextEditingController();
    _paragraphDescriptionTextController = TextEditingController();
  }

  @override
  void dispose() {
    _paragraphTextController.dispose();
    _paragraphDescriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            KTextFormFieldBuilderWithTitle(
              title: "অনুচ্ছেদ",
              hintText: "অনুচ্ছেদ লিখুন",
              secondaryHitText: "৪৫ শব্দ",
              controller: _paragraphTextController,
            ),
            KDropDownFieldBuilderWithTitle(
              title: "অনুচ্ছেদের বিভাগ",
              hintText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন",
              items: paragraphCategories,
              value: _selectedParagraphCategory,
              onChanged: (value) {},
              itemBuilder: (item) => Text(item!),
            ),
            KBlankFieldBuilderWithTitle(
              title: "তারিখ ও সময়",
              content: Text(""),
            ),
            KDropDownFieldBuilderWithTitle(
              title: "স্থান",
              hintText: "নির্বাচন করুন",
              items: places,
              value: _selectedPlace,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(13.0),
                child: SvgPicture.asset(
                  AssetPath.locationIcon,
                  colorFilter: const ColorFilter.mode(
                    kGreyTextColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              onChanged: (value) {},
              itemBuilder: (item) => Text(item!),
            ),
            KTextFormFieldBuilderWithTitle(
              title: "অনুচ্ছেদের বিবরণ",
              hintText: "কার্যক্রমের বিবরণ লিখুন",
              secondaryHitText: "১২০ শব্দ",
              minLine: 7,
              maxLine: 7,
              controller: _paragraphDescriptionTextController,
            ),
          ],
        ),
      ),
    );
  }
}

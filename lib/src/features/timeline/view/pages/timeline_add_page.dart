import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_manager/src/core/extensions/date_time_extension.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/fake_data/fake_data.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/widgets/k_button.dart';
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

  late final TextEditingController _dateTimeTextController;
  final GlobalKey<FormState> _timelineFormKey = GlobalKey<FormState>();

  DateTime? selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    ).then((picked) async {
      if (picked != null) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          setState(() {
            selectedDateTime = DateTime(
              picked.year,
              picked.month,
              picked.day,
              pickedTime.hour,
              pickedTime.minute,
            );

            _dateTimeTextController.text =
                selectedDateTime?.formattedDateTime ?? "";
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _paragraphTextController = TextEditingController();
    _paragraphDescriptionTextController = TextEditingController();
    _dateTimeTextController = TextEditingController();
  }

  @override
  void dispose() {
    _paragraphTextController.dispose();
    _paragraphDescriptionTextController.dispose();
    _dateTimeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _timelineFormKey,
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
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedParagraphCategory = value;
                    });
                  }
                },
                itemBuilder: (item) => Text(item!),
              ),
              KTextFormFieldBuilderWithTitle(
                title: "তারিখ ও সময়",
                hintText: "নির্বাচন করুন",
                readOnly: true,
                prefixIconPath: AssetPath.calendarOutlinedIcon,
                suffixIconPath: AssetPath.arrowForwardIcon,
                onTap: () => _selectDateTime(context),
                controller: _dateTimeTextController,
              ),
              KDropDownFieldBuilderWithTitle(
                title: "স্থান",
                hintText: "নির্বাচন করুন",
                items: places,
                value: _selectedPlace,
                prefixIconPath: AssetPath.locationIcon,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedPlace = value;
                    });
                  }
                },
                itemBuilder: (item) => Text(item!),
              ),
              KTextFormFieldBuilderWithTitle(
                title: "অনুচ্ছেদের বিবরণ",
                hintText: "কার্যক্রমের বিবরণ লিখুন",
                secondaryHitText: "১২০ শব্দ",
                minLine: 4,
                maxLine: 4,
                inputAction: TextInputAction.done,
                controller: _paragraphDescriptionTextController,
              ),
              const SizedBox(height: 20),
              KButton(
                onPressed: _onPressedSave,
                child: Text(
                  "সংরক্ষন করুন",
                  style: context.buttonTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedSave() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: _SuccessfulParagraphDialogContent(
            onAddMore: _onAddMore,
          ),
        );
      },
    );
  }

  void _onAddMore() {
    Navigator.pop(context);
    _paragraphTextController.clear();
    _paragraphDescriptionTextController.clear();
    _dateTimeTextController.clear();
    _selectedPlace = null;
    _selectedParagraphCategory = null;
    selectedDateTime = null;
    setState(() {});
  }
}

class _SuccessfulParagraphDialogContent extends StatelessWidget {
  final VoidCallback onAddMore;

  const _SuccessfulParagraphDialogContent({
    required this.onAddMore,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      sized: false,
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AssetPath.successfulCheckedIcon,
            ),
            const SizedBox(height: 30),
            Text(
              "নতুন অনুচ্ছেদ সংরক্ষন",
              textAlign: TextAlign.center,
              style: context.titleMedium(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে ",
              textAlign: TextAlign.center,
              style: context.bodyLarge(),
            ),
            const SizedBox(height: 20),
            KButton(
              onPressed: onAddMore,
              child: Text(
                "আরও যোগ করুন",
                style: context.buttonTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

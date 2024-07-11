import 'package:flutter/material.dart';
import 'package:timeline_manager/src/core/extensions/text_style_extension.dart';
import 'package:timeline_manager/src/core/utils/asset_path.dart';
import 'package:timeline_manager/src/core/utils/color.dart';

class KCustomLoader extends StatefulWidget {
  final String? titleText;

  const KCustomLoader({Key? key, this.titleText}) : super(key: key);

  @override
  State<KCustomLoader> createState() => _KCustomLoaderState();
}

class _KCustomLoaderState extends State<KCustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorAnimation = ColorTween(
      begin: gradiantColor1,
      end: gradiantColor2,
    ).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                    valueColor: _colorAnimation,
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(AssetPath.appLogo),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.titleText ?? 'Please Wait...',
              style: context.titleMedium(),
            ),
          ],
        ),
      ),
    );
  }
}

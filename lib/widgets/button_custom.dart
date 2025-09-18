import 'package:flutter/material.dart';
import 'package:prime_diversition/constants/app_text_styles.dart';
import 'package:prime_diversition/constants/colours.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor = Colours.primary,
    this.fontSize,
  });
  final String? text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shadowColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        text ?? 'Button Custom',
        style: AppTextStyles.medium.copyWith(fontSize: fontSize ?? 16, color: Colours.white),
      ),
    );
  }
}

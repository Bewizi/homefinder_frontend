import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';

class AppField extends StatelessWidget {
  final String title;
  final bool showTitle;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final int minLines;
  final int maxLines;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String)? onChanged;
  final bool obscureText;

  const AppField({
    super.key,
    required this.title,
    this.showTitle = true,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.obscureText = false,
  });

  Widget _buildTextFormField(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      obscureText: obscureText,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.kGrey30,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kPlatinum, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kPlatinum, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kPlatinum, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: prefix,
        prefixIconColor: AppColors.kGrey30,
        suffixIcon: suffix,
        suffixIconColor: AppColors.kGrey30,
      ),
      onChanged: (value) => onChanged?.call(value),
      validator: (value) => validator?.call(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) ...[
          TextRegular(
            title,
            color: AppColors.kJet,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ],
        SizedBox(height: 8.h),
        _buildTextFormField(context),
      ],
    );
  }
}

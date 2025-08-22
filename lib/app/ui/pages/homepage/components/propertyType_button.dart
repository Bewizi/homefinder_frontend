import 'package:flutter/material.dart';
import 'package:frontend/app/ui/themes/theme.dart';

class PropertyTypeButton extends StatefulWidget {
  const PropertyTypeButton({super.key});

  @override
  State<PropertyTypeButton> createState() => _PropertyTypeButtonState();
}

class _PropertyTypeButtonState extends State<PropertyTypeButton> {
  final List<String> propertyTypes = [
    'All',
    'Apartment',
    'Bungalow',
    'Duplex',
    'Villa',
  ];

  String? selectedType = 'All';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: propertyTypes.length,
        itemBuilder: (context, index) {
          final type = propertyTypes[index];
          final isSelected = type == selectedType;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected
                    ? AppColors.primaryButton
                    : Colors.transparent,
                foregroundColor: isSelected
                    ? AppColors.splashScreenText
                    : AppColors.textGray,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(color: AppColors.borderColor, width: 1),
                elevation: 0,
              ),
              onPressed: () {
                if (isSelected) {
                  setState(() {
                    // AppColors.primaryButton;
                    selectedType = null;
                  });
                } else {
                  setState(() {
                    // AppColors.textBlack;
                    selectedType = type;
                  });
                }
              },
              child: Text(type),
            ),
          );
        },
      ),
    );
  }
}

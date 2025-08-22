import 'package:flutter/material.dart';
import 'package:homefinder/app/ui/themes/theme.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key});

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  final TextEditingController iconController = TextEditingController();
  String? selectedLocation;

  final List<String> locations = [
    'Alakija Street, Lagos',
    'Abuja',
    'Osun',
    'Ibadan',
    'Port Harcourt',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      closeBehavior: DropdownMenuCloseBehavior.none,

      controller: iconController,
      // width: 279,
      enableFilter: true,
      requestFocusOnTap: true,
      textStyle: Theme.of(context).textTheme.titleMedium,
      leadingIcon: Icon(
        Icons.location_on_rounded,
        color: AppColors.primaryText,
      ),
      selectedTrailingIcon: Icon(Icons.arrow_drop_up, size: 20),
      hintText: 'Select Location',
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: (String? value) {
        setState(() {
          selectedLocation = value;
        });
      },
      menuStyle: MenuStyle(
        elevation: WidgetStatePropertyAll(1),
        backgroundColor: WidgetStatePropertyAll(AppColors.splashScreenText),
      ),
      dropdownMenuEntries: locations
          .map(
            (location) =>
                DropdownMenuEntry<String>(value: location, label: location),
          )
          .toList(),
    );
  }
}

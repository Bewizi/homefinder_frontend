import 'package:flutter/material.dart';
import 'package:frontend/app/ui/pages/homepage/components/custom_dropDownMenu.dart';
import 'package:frontend/app/ui/pages/homepage/components/propertyType_button.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextMedium('Location'),

                    const SizedBox(height: 6),

                    // Dropdown Menu for user to select location or places
                    CustomDropDownMenu(),
                  ],
                ),

                // notification icon
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Badge(
                      label: null,
                      child: const Icon(LucideIcons.bell),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            PropertyTypeButton(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homefinder/app/ui/pages/homepage/components/custom_dropDownMenu.dart';
import 'package:homefinder/app/ui/pages/homepage/components/property.dart';
import 'package:homefinder/app/ui/pages/homepage/components/propertyType_button.dart';
import 'package:homefinder/app/ui/pages/homepage/components/recommended_property.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:homefinder/app/ui/widgets/styled_text.dart';
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
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable content (Properties + RecommendedProperties)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 180, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Properties(),
                    SizedBox(height: 24),
                    RecommendedProperties(),
                  ],
                ),
              ),
            ),

            // Fixed header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                height: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextMedium('Location'),
                            const SizedBox(height: 6),

                            // Dropdown menu for location
                            CustomDropDownMenu(),
                          ],
                        ),

                        // notification bell
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
            ),
          ],
        ),
      ),
    );
  }
}

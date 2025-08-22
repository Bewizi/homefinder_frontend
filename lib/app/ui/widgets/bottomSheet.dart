import 'package:flutter/material.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:homefinder/app/ui/widgets/custom_buttons.dart';
import 'package:homefinder/app/ui/widgets/styled_text.dart';

class ShowAccessLocation {
  static void showModal(
    BuildContext context, {
    required Function(String location) onLocationChosen,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 436,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(24),
              right: Radius.circular(25),
            ),
            color: AppColors.splashScreenText,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColors.textGray,
                        size: 16,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 38),

                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryButton,
                      ),
                      child: Icon(
                        Icons.location_on_rounded,
                        color: AppColors.splashScreenText,
                        size: 36,
                      ),
                    ),

                    SizedBox(height: 16),

                    TextHeading('Access Location'),

                    SizedBox(height: 16),

                    TextSmall(
                      'Enable location access to find homes near you faster\nand more accurately',
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 32),

                    SubmitButton(
                      'Allow location access',
                      onPressed: () {
                        onLocationChosen('Current Location');
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 16),
                    SubmitButton(
                      'Enter location manually',
                      onPressed: () {
                        onLocationChosen('Manual Location');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

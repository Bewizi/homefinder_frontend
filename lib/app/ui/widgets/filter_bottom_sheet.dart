import 'package:flutter/material.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:homefinder/app/ui/widgets/styled_text.dart';

class ShowPropertyFilter {
  static void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 90),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // button to close bottomsheet
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(child: Center(child: TextSmall('Filter'))),

                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.close,
                                size: 16,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [TextMedium('Price Range')],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Bottom fixed buttons
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 77,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Clear Filters"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Show Results"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

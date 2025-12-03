import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homefinder/core/presentation/constant/svgs.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';
import 'package:homefinder/features/home/widget/nearby_homes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _filterOptions = [
    {'text': 'All', 'isSelected': true},
    {'text': 'Apartment', 'isSelected': false},
    {'text': 'Bungalow', 'isSelected': false},
    {'text': 'Duplex', 'isSelected': false},
    {'text': 'Villa', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 100,
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRegular(
                        'Location',
                        color: AppColors.kGrey30,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppSvgs.kLocation,
                            width: 20,
                            height: 20,
                            fit: BoxFit.scaleDown,
                          ),
                          const SizedBox(width: 4),
                          TextRegular(
                            'Alakija Street, Lagos',
                            fontWeight: FontWeight.w600,
                            color: AppColors.kJet,
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            AppSvgs.kCaretDown,
                            width: 16,
                            height: 16,
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.kGrey5, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      AppSvgs.kNotificationBing,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _filterOptions.length,
                    itemBuilder: (context, index) {
                      final filterOption = _filterOptions[index];

                      return _buildFilterButton(
                        filterOption['text'],
                        filterOption['isSelected'],
                        () => setState(() {
                          for (var option in _filterOptions) {
                            option['isSelected'] = false;
                          }
                          _filterOptions[index]['isSelected'] = true;
                        }),
                      );
                    },
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: const NearbyHomes(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFilterButton(String text, bool isSelected, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.kBrand50 : AppColors.kWhite,
        border: Border.all(color: AppColors.kGrey5, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextRegular(
        text,
        color: isSelected ? AppColors.kWhite : AppColors.kJet,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    ),
  );
}

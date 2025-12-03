import 'package:flutter/material.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';

class NearbyHomes extends StatefulWidget {
  const NearbyHomes({super.key});

  @override
  State<NearbyHomes> createState() => _NearbyHomesState();
}

class _NearbyHomesState extends State<NearbyHomes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextRegular(
                'Homes Near You',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.kJet,
              ),
              InkWell(
                onTap: () {},
                child: TextRegular(
                  'See all',
                  color: AppColors.kBrand50,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

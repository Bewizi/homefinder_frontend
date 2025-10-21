import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/core/presentation/constant/svgs.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';
import 'package:homefinder/features/auth/signin/signin.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  static const String routeName = '/onBoarding';

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 3;

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 90),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: []),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (pages) {
                  setState(() {
                    _currentPage = pages;
                  });
                },
                children: <Widget>[
                  //   First Page
                  _buildOnboardingPage(
                    title: 'Direct Rentals Made Easy ',
                    description:
                        'Homefinder connects you with verified landlords, so you can find your next home with trust, transparency, and no hidden costs.',
                    imagePath: AppSvgs.kAmicoOne,
                  ),

                  // Second Page
                  _buildOnboardingPage(
                    title: 'See It Like You\'re There',
                    description:
                        'Each listing comes with a detailed video tour showcasing the house. You can also schedule in-person tour to inspect the space at no cost.',
                    imagePath: AppSvgs.kAmicoTwo,
                  ),

                  // Third Page
                  _buildOnboardingPage(
                    title: 'Rent Smarter, All in One App',
                    description:
                        'Homefinder gives you full control of your rental journey. Explore listings, chat with landlords, make payment, send move-out notice,  all within the app.',
                    imagePath: AppSvgs.kAmicoThree,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //   Previous Button
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.kBrand50),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: _currentPage > 0 ? _previousPage : null,
                      icon: SvgPicture.asset(
                        AppSvgs.kCurvedArrowBack,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),

                  // Page Indicators
                  Row(
                    children: List.generate(
                      _totalPages,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == _currentPage ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: index == _currentPage
                              ? AppColors.kBrand50
                              : AppColors.kGrey5,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // Next Button
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.kBrand50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: _currentPage < _totalPages - 1
                          ? _nextPage
                          : () {
                              // Handle completion - navigate to main app
                              context.go(SignIn.routeName);
                            },
                      icon: SvgPicture.asset(
                        AppSvgs.kCurvedArrowForward,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image Container
          Container(
            width: 342,
            height: 284.47,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SvgPicture.asset(
                imagePath,
                width: 340,
                height: 309,
                fit: BoxFit.scaleDown,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.kGrey20,
                    child: Center(
                      child: Icon(
                        Icons.image,
                        size: 64,
                        color: AppColors.kGrey5,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Title
          TextHeading(
            title,
            fontSize: 24,
            color: AppColors.kGrey40,
            fontWeight: FontWeight.w700,

            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextRegular(
              description,
              color: AppColors.kGrey30,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

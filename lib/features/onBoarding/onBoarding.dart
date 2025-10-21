import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homefinder/core/presentation/constant/svgs.dart';
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
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: _currentPage > 0 ? _previousPage : null,
                      icon: Icon(
                        Icons.arrow_back,
                        color: _currentPage > 0
                            ? Colors.grey
                            : Colors.grey.shade400,
                      ),
                    ),
                  ),

                  // Page Indicators
                  Row(
                    children: List.generate(
                      _totalPages,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == _currentPage ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: index == _currentPage
                              ? Colors.blue
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // Next Button
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: _currentPage < _totalPages - 1
                          ? _nextPage
                          : () {
                              // Handle completion - navigate to main app
                              context.go(SignIn.routeName);
                            },
                      icon: Icon(
                        _currentPage < _totalPages - 1
                            ? Icons.arrow_forward
                            : Icons.check,
                        color: Colors.white,
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
                    color: Colors.grey.shade100,
                    child: const Center(
                      child: Icon(Icons.image, size: 64, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Title
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/app/data/models/home_models.dart';
import 'package:homefinder/app/provider/property_provider.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:homefinder/app/ui/widgets/custom_buttons.dart';
import 'package:homefinder/app/ui/widgets/styled_text.dart';
import 'package:provider/provider.dart';

class PropertyDetails extends StatefulWidget {
  final String propertyId;

  const PropertyDetails({super.key, required this.propertyId});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  final int _totalPage = 5;

  List<String> _getPropertyImages(Property property) {
    List<String> imagesUrl = [];

    if (property.imageUrls.isNotEmpty) {
      imagesUrl.addAll(property.imageUrls);
    }

    return imagesUrl;
  }

  @override
  void initState() {
    super.initState();
    // Load property details if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<PropertyProvider>();
      if (provider.selectedProperty?.id != widget.propertyId) {
        final property = provider.getPropertyById(widget.propertyId);
        if (property != null) {
          provider.selectProperty(property);
        }
      }
    });
  }

  void _nextPage() {
    if (currentPage < _totalPage - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Consumer<PropertyProvider>(
        builder: (context, propertyProvider, child) {
          final property = propertyProvider.selectedProperty;

          // if no property found
          if (property == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text('Property not found'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            );
          }

          // property images
          final imagesUrl = _getPropertyImages(property);

          return CustomScrollView(
            slivers: [
              // App Bar with Image
              SliverAppBar(
                expandedHeight: 399,
                pinned: true,
                backgroundColor: AppColors.primaryButton,
                // go back arrow
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: AppColors.splashScreenText,
                  ),
                ),
                actions: [
                  // favorite icons to love a property
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      property.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: property.isFavorite
                          ? Colors.red
                          : AppColors.splashScreenText,
                      size: 32,
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        onPageChanged: (pages) {
                          setState(() {
                            currentPage = pages;
                          });
                        },
                        itemCount: imagesUrl.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: double.infinity,
                            child: _buildPropertyImages(imagesUrl[index]),
                          );
                        },
                      ),

                      // ADDED:next and previous arrows for the images
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // previous arrow icon
                            IconButton(
                              onPressed: _previousPage,
                              icon: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFFFFF),
                                      Color(0xFFC8C8C8),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: AppColors.textBlack,
                                  size: 24,
                                ),
                              ),
                            ),

                            // next arrow icon
                            IconButton(
                              onPressed: _nextPage,
                              icon: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFFFFF),
                                      Color(0xFFC8C8C8),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.textBlack,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ADDED: Dots indicator at bottom
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            imagesUrl.length,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 3),
                              width: currentPage == index ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: currentPage == index
                                    ? AppColors.primaryButton
                                    : AppColors.splashScreenText,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Property Details Content
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // property name,location,rating,and specs
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // this will always upadate when the property changes
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.AliceBlue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Apartment',
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // rating tag or text
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              RichText(
                                text: TextSpan(
                                  text: property.rating.toString(),
                                  style: TextStyle(
                                    color: AppColors.darkGray,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '/5.0',
                                      style: TextStyle(
                                        color: AppColors.darkGray,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Property Name,location and specs
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextMedium(property.name),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 16),
                              const SizedBox(width: 4),
                              // property location
                              TextSmall(property.location, fontSize: 12),
                            ],
                          ),

                          // specs like bed,bath,area
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildSpecItem(
                                Icons.bed_outlined,
                                property.specs[0],
                              ),

                              Container(
                                height: 24,
                                child: VerticalDivider(
                                  color: AppColors.darkGray,
                                  thickness: 1,
                                ),
                              ),

                              _buildSpecItem(
                                Icons.bathtub_outlined,
                                property.specs[1],
                              ),

                              Container(
                                height: 24,
                                child: VerticalDivider(
                                  color: AppColors.darkGray,
                                  thickness: 1,
                                ),
                              ),

                              _buildSpecItem(
                                Icons.square_foot_outlined,
                                property.specs[2],
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // description
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextMedium('Details'),
                              const SizedBox(height: 8),
                              TextSmall(
                                property.details,
                                height: 2,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),

                          const SizedBox(height: 32),

                          // landlord details and contact button
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextMedium('Landlord Details'),

                              const SizedBox(height: 16),

                              Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 8,
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.borderColor,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    children: [
                                      // image of the landlord
                                      CircleAvatar(
                                        radius: 45,
                                        backgroundImage: NetworkImage(
                                          property.landLordImage,
                                        ),
                                        backgroundColor: AppColors.darkGray,
                                        // child: Text('EP'),
                                      ),

                                      const SizedBox(height: 16),

                                      // landlord name
                                      TextMedium(property.landLordName),

                                      const SizedBox(height: 4),

                                      // verified tag
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF0FDF4),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.verified,
                                              color: Color(0xFF22C55E),
                                              size: 12,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Verified',
                                              style: TextStyle(
                                                color: Color(0xFF22C55E),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 16),
                                      TextSmall(
                                        'Trusted landlord known for prompt communication, well-\nmaintained properties, and a tenant-first approach.',
                                        textAlign: TextAlign.center,
                                        height: 2,
                                        color: AppColors.darkGray,
                                      ),

                                      const SizedBox(height: 16),

                                      CustomButtons(onPressed: () {}),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // widget for other images
  Widget _buildPropertyImages(String imageUrls) {
    return Image.network(
      imageUrls,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },

      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[300],
          child: Icon(
            Icons.image_not_supported,
            color: Colors.grey[600],
            size: 50,
          ),
        );
      },
    );
  }

  // Widget for property specs
  Widget _buildSpecItem(IconData icon, String spec) {
    return Container(
      padding: EdgeInsets.all(12),

      child: Row(
        children: [
          Icon(icon, color: AppColors.darkGray, size: 24),
          SizedBox(width: 8),
          TextSmall(spec, fontSize: 12, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}

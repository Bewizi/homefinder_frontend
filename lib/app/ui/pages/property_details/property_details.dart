// lib/app/ui/pages/propertyDetails/property_details.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Consumer<PropertyProvider>(
        builder: (context, propertyProvider, child) {
          final property = propertyProvider.selectedProperty;

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

          return CustomScrollView(
            slivers: [
              // App Bar with Image
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: AppColors.primaryButton,
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.textBlack,
                      size: 16,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        property.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: property.isFavorite
                            ? Colors.red
                            : AppColors.textBlack,
                        size: 20,
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(property.image, fit: BoxFit.cover),
                ),
              ),

              // Property Details Content
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Property Name and Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: TextHeading(property.name)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.buttonBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                TextSmall(
                                  property.rating.toString(),
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8),

                      // Location
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.textGray,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextSmall(
                              property.location,
                              fontSize: 14,
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 16),

                      // Price
                      RichText(
                        text: TextSpan(
                          text: '₦${property.price}M',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryButton,
                          ),
                          children: [
                            TextSpan(
                              text: '/year',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGray,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24),

                      // Specs
                      TextMedium('Property Details'),
                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildSpecItem(Icons.bed_outlined, property.specs[0]),
                          _buildSpecItem(
                            Icons.bathtub_outlined,
                            property.specs[1],
                          ),
                          _buildSpecItem(
                            Icons.square_foot_outlined,
                            property.specs[2],
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Description
                      TextMedium('Description'),
                      SizedBox(height: 12),
                      TextSmall(
                        property.details,
                        fontSize: 14,
                        color: AppColors.textGray,
                      ),

                      SizedBox(height: 32),

                      // Contact Button
                      SubmitButton(
                        'Contact Agent',
                        onPressed: () {
                          // Implement contact functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Contact feature coming soon!'),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 16),
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

  Widget _buildSpecItem(IconData icon, String spec) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.buttonBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryButton, size: 24),
          SizedBox(height: 8),
          TextSmall(spec, fontSize: 12, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}

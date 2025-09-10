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
                expandedHeight: 399,
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

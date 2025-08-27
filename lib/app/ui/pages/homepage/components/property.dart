import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/app/data/models/home_models.dart';
import 'package:homefinder/app/provider/property_provider.dart';
import 'package:homefinder/app/routes/app_routes.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:homefinder/app/ui/widgets/custom_buttons.dart';
import 'package:homefinder/app/ui/widgets/styled_text.dart';
import 'package:provider/provider.dart';

class Properties extends StatefulWidget {
  const Properties({super.key});

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  // List<Property> _properties = [];

  // bool _isLoading = true;
  // String? _errorMessage;
  static const int _perPage = 3;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PropertyProvider>().fetchProperties();
    });

    // _getProperties();
  }

  // view all properties
  void _navigateToAllProperties() {
    context.push(RouteNames.allProperties);
  }

  void _navigateToPropertyDetails(Property property) {
    context.read<PropertyProvider>().selectProperty(property);

    context.push('/property-details/${property.id}');
  }

  // api from the backend
  // Future<void> _getProperties() async {
  //   try {
  //     setState(() {
  //       _isLoading = true;
  //       _errorMessage = null;
  //     });
  //     List<Property> properties = await PropertyService.getProperties();

  //     setState(() {
  //       _properties = properties;
  //       _isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _isLoading = false;
  //       _errorMessage = e.toString();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextMedium('Homes Near You'),
            ButtonText(
              'View All',
              fontSize: 12,
              onPressed: _navigateToAllProperties,
            ),
          ],
        ),

        SizedBox(
          height: 345,
          child: Consumer<PropertyProvider>(
            builder: (context, propertyProvider, child) {
              if (propertyProvider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (propertyProvider.errorMessage != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        'Error loading properties',
                        style: TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => propertyProvider.fetchProperties(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (propertyProvider.properties.isEmpty) {
                return const Center(child: Text('No properties available'));
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: propertyProvider.properties.length > _perPage
                    ? _perPage
                    : propertyProvider.properties.length,
                itemBuilder: (context, index) {
                  final property = propertyProvider.properties[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: PropertyContainer(
                      property: property,
                      onTap: () => _navigateToPropertyDetails(property),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class PropertyContainer extends StatelessWidget {
  const PropertyContainer({
    super.key,
    required this.property,
    this.onTap,
    this.onFavoriteToggle,
  });

  final Property property;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 286,
        height: 341,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor, width: 2),
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    property.image,
                    fit: BoxFit.cover,
                    height: 220,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  right: 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Rating
                      Container(
                        width: 46,
                        height: 22,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(88),
                          color: AppColors.splashScreenText,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 12),
                            SizedBox(width: 4),
                            TextSmall(
                              property.rating.toString(),
                              color: AppColors.textBlack,
                              fontSize: 10,
                            ),
                          ],
                        ),
                      ),

                      // Favorite icon
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.splashScreenText,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(
                            property.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline_rounded,
                            size: 16,
                            color: property.isFavorite
                                ? Colors.red
                                : AppColors.primaryText,
                          ),
                          onPressed: onFavoriteToggle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Property name
                Expanded(
                  child: TextSmall(property.name, color: AppColors.textBlack),
                ),

                // Property price
                RichText(
                  text: TextSpan(
                    text: '₦${property.price.toString()}M',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryButton,
                    ),
                    children: [
                      TextSpan(
                        text: '/year',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Property location
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.textGray,
                  size: 16,
                ),
                SizedBox(width: 8.0),
                Expanded(child: TextSmall(property.location, fontSize: 12)),
              ],
            ),

            SizedBox(height: 12),

            // Property specs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.bed_outlined,
                      color: AppColors.textGray,
                      size: 16,
                    ),
                    SizedBox(width: 8.0),
                    TextSmall(property.specs[0], fontSize: 12),
                  ],
                ),

                SizedBox(
                  height: 16,
                  child: VerticalDivider(
                    color: Color.fromRGBO(204, 204, 204, 1),
                  ),
                ),

                Row(
                  children: [
                    Icon(
                      Icons.bathtub_outlined,
                      color: AppColors.textGray,
                      size: 16,
                    ),
                    SizedBox(width: 8.0),
                    TextSmall(property.specs[1], fontSize: 12),
                  ],
                ),

                SizedBox(
                  height: 16,
                  child: VerticalDivider(
                    color: Color.fromRGBO(204, 204, 204, 1),
                  ),
                ),

                Row(
                  children: [
                    Icon(
                      Icons.square_foot_outlined,
                      color: AppColors.textGray,
                      size: 16,
                    ),
                    SizedBox(width: 8.0),
                    TextSmall(property.specs[2], fontSize: 12),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

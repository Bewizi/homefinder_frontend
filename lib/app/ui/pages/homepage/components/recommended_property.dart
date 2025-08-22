import 'package:flutter/material.dart';
import 'package:homefinder/app/data/models/recommededed_home_models.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:homefinder/app/ui/widgets/styled_text.dart';

class RecommendedProperties extends StatefulWidget {
  const RecommendedProperties({super.key});

  @override
  State<RecommendedProperties> createState() => _RecommendedPropertiesState();
}

class _RecommendedPropertiesState extends State<RecommendedProperties> {
  List<RecommendedHomes> _properties = [];

  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _getRecommendedProperties();
  }

  Future<void> _getRecommendedProperties() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
      List<RecommendedHomes> properties =
          await RecommendedPropertyService.getProperties();

      setState(() {
        _properties = properties;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [TextMedium('Recommended Homes')],
        ),
        SizedBox(height: 16),

        SizedBox(
          height: 345,
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _errorMessage != null
              ? Center(
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
                        onPressed: _getRecommendedProperties,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _properties.isEmpty
              ? const Center(child: Text('No properties available'))
              : ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: _properties.length,
                  itemBuilder: (context, index) {
                    final recommendedProperty = _properties[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PropertyContainer(property: recommendedProperty),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class PropertyContainer extends StatelessWidget {
  const PropertyContainer({super.key, required this.property});

  final RecommendedHomes property;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    // rating
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

                    // favorite icon
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
                          Icons.favorite_outline_rounded,
                          size: 16,
                          color: AppColors.primaryText,
                        ),
                        onPressed: () {},
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
              // property name
              TextSmall(property.name, color: AppColors.textBlack),

              // property price
              RichText(
                text: TextSpan(
                  text: '#${property.price.toString()}M',
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

          // property location
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.textGray,
                size: 16,
              ),
              SizedBox(width: 8.0),
              TextSmall(property.location, fontSize: 12),
            ],
          ),

          SizedBox(height: 12),

          // property specs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bed_outlined, color: AppColors.textGray, size: 16),
                  SizedBox(width: 8.0),
                  TextSmall(property.specs[0], fontSize: 12),
                ],
              ),

              SizedBox(
                height: 16,
                child: VerticalDivider(color: Color.fromRGBO(204, 204, 204, 1)),
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
                child: VerticalDivider(color: Color.fromRGBO(204, 204, 204, 1)),
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
    );
  }
}

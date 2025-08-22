import 'package:flutter/material.dart';
import 'package:frontend/app/data/models/home_models.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';

class MySqaure extends StatefulWidget {
  const MySqaure({super.key});

  @override
  State<MySqaure> createState() => _MySqaureState();
}

class _MySqaureState extends State<MySqaure> {
  List<Property> _properties = [];

  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _getProperties();
  }

  Future<void> _getProperties() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
      List<Property> properties = await PropertyService.getProperties();

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
    return SizedBox(
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
                    onPressed: _getProperties,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : _properties.isEmpty
          ? const Center(child: Text('No properties available'))
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _properties.length,
              itemBuilder: (context, index) {
                final property = _properties[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: PropertyContainer(property: property),
                );
              },
            ),
    );
  }
}

class PropertyContainer extends StatelessWidget {
  const PropertyContainer({super.key, required this.property});

  final Property property;

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
              TextSmall(property.name, color: AppColors.textBlack),
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homefinder/app/data/models/home_models.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:homefinder/app/ui/widgets/styled_text.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AllProperties extends StatefulWidget {
  const AllProperties({super.key});

  @override
  State<AllProperties> createState() => _AllPropertiesState();
}

class _AllPropertiesState extends State<AllProperties> {
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // search properties
                  Expanded(
                    flex: 20,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1.5,
                        ),
                      ),

                      // input text field
                      child: TextField(
                        style: Theme.of(context).textTheme.titleMedium,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            LucideIcons.search,
                            size: 16,
                            color: AppColors.textGray,
                          ),
                          hintText: 'Search for properties',
                          hintStyle: Theme.of(context).textTheme.titleSmall,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Spacer(),

                  // filter icon
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 44,
                      height: 40,
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1.5,
                        ),
                      ),
                      child: Icon(
                        FontAwesomeIcons.sliders,
                        size: 20,
                        color: Color.fromRGBO(82, 82, 82, 1),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _errorMessage != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
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
                        // scrollDirection: Axis.horizontal,
                        itemCount: _properties.length,
                        itemBuilder: (context, index) {
                          final property = _properties[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: PropertyContainer(property: property),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
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

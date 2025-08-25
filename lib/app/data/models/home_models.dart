class Property {
  final String id;
  final bool isFavorite;
  final double rating;
  final String name;
  final String location;
  final List<String> imageUrls;
  final String image;
  final double price;
  final String details;
  final List<String> specs;

  Property({
    required this.id,
    this.isFavorite = false,
    required this.rating,
    required this.name,
    required this.location,
    required this.imageUrls,
    required this.price,
    required this.details,
    required this.image,
    required this.specs,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'isFavorite': isFavorite,
    'rating': rating,
    'homeName': name,
    'location': location,
    'imageUrls': imageUrls,
    'price': price,
    'details': details,
    'image': image,
    'specs': specs,
  };

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json['id'] ?? '',
    isFavorite: json['isFavorite'] ?? false,
    rating: (json['rating'] ?? 0).toDouble(),
    name: json['homeName'] ?? '',
    location: json['location'] ?? '',
    imageUrls: List<String>.from(json['imageUrls'] ?? []),
    price: (json['price'] ?? 0).toDouble(),
    details: json['details'] ?? '',
    image: json['image'] ?? '',
    specs: List<String>.from(json['specs'] ?? []),
  );

  Property copyWith({
    String? id,
    bool? isFavorite,
    double? rating,
    String? name,
    String? location,
    List<String>? imageUrls,
    double? price,
    String? details,
    String? image,
    List<String>? specs,
  }) {
    return Property(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      name: name ?? this.name,
      location: location ?? this.location,
      imageUrls: imageUrls ?? this.imageUrls,
      price: price ?? this.price,
      details: details ?? this.details,
      image: image ?? this.image,
      specs: specs ?? this.specs,
    );
  }

  @override
  String toString() {
    return 'Property(id: $id, image: $image, isFavorite: $isFavorite, rating: $rating, name: $name, location: $location, imageUrls: $imageUrls, price: $price, details: $details, specs: $specs)';
  }
}

class PropertyService {
  static List<Property> getSampleProperties() {
    return [
      Property(
        id: '1',
        rating: 4.95,
        name: 'Starlight Residence',
        location: 'Oyin Jolayemi Street, Lagos',
        details:
            'A beautiful, modern apartment in the heart of downtown. Recently renovated with high-end finishes and appliances. Featuring an open floor plan, large windows providing plenty of natural light, and a spacious balcony with city views. Building amenities include a fitness center, rooftop lounge, and 24-hour concierge service.',
        price: 3.25,
        isFavorite: false,
        imageUrls: [],
        image: 'assets/images/Starlight Residence.png',
        specs: ['3 Bedrooms', '2 Baths', '1,200 sqft'],
      ),

      Property(
        id: '2',
        rating: 4.93,
        name: 'Maplewood Cottage',
        location: 'House 5, Ngozi Close, Port Harcourt',
        details:
            'A beautiful, modern apartment in the heart of downtown. Recently renovated with high-end finishes and appliances. Featuring an open floor plan, large windows providing plenty of natural light, and a spacious balcony with city views. Building amenities include a fitness center, rooftop lounge, and 24-hour concierge service.',
        price: 1.20,
        isFavorite: false,
        imageUrls: [],
        image: 'assets/images/Maplewood Cottage.png',
        specs: ['2 Bedrooms', '2 Baths', '1,000 sqft'],
      ),

      Property(
        id: '3',
        rating: 4.90,
        name: 'Grove Homestead',
        location: 'Block 3, Victoria Gardens, Lagos',
        details:
            'A beautiful, modern apartment in the heart of downtown. Recently renovated with high-end finishes and appliances. Featuring an open floor plan, large windows providing plenty of natural light, and a spacious balcony with city views. Building amenities include a fitness center, rooftop lounge, and 24-hour concierge service.',
        price: 1.25,
        isFavorite: false,
        imageUrls: [],
        image: 'assets/images/Grove Homestead.jpg',
        specs: ['2 Bedrooms', '2 Baths', '1,200 sqft'],
      ),

      Property(
        id: '4',
        rating: 4.90,
        name: 'Sunnydale Cottage',
        location: 'Block 12, Mercy Estate, Ibadan',
        details:
            'A beautiful, modern apartment in the heart of downtown. Recently renovated with high-end finishes and appliances. Featuring an open floor plan, large windows providing plenty of natural light, and a spacious balcony with city views. Building amenities include a fitness center, rooftop lounge, and 24-hour concierge service.',
        price: 1.50,
        isFavorite: false,
        imageUrls: [],
        image: 'assets/images/Sunnydale Cottage.jpg',
        specs: ['3 Bedrooms', '3 Baths', '1,200 sqft'],
      ),
    ];
  }

  static Future<List<Property>> getProperties() async {
    await Future.delayed(const Duration(seconds: 2));
    return getSampleProperties();
  }
}

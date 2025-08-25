class RecommendedHomes {
  final String id;
  final bool isFavorite;
  final double rating;
  final String name;
  final String location;
  final String image;
  final double price;
  final String details;
  final List<String> specs;

  RecommendedHomes({
    required this.id,
    this.isFavorite = false,
    required this.rating,
    required this.name,
    required this.location,
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
    'price': price,
    'details': details,
    'image': image,
    'specs': specs,
  };

  factory RecommendedHomes.fromJson(Map<String, dynamic> json) =>
      RecommendedHomes(
        id: json['id'] ?? '',
        isFavorite: json['isFavorite'] ?? false,
        rating: (json['rating'] ?? 0).toDouble(),
        name: json['homeName'] ?? '',
        location: json['location'] ?? '',
        price: (json['price'] ?? 0).toDouble(),
        details: json['details'] ?? '',
        image: json['image'] ?? '',
        specs: List<String>.from(json['specs'] ?? []),
      );

  RecommendedHomes copyWith({
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
    return RecommendedHomes(
      id: id ?? this.id,
      rating: rating ?? this.rating,
      name: name ?? this.name,
      location: location ?? this.location,
      price: price ?? this.price,
      details: details ?? this.details,
      image: image ?? this.image,
      specs: specs ?? this.specs,
    );
  }

  @override
  String toString() {
    return 'Property(id: $id, image: $image, isFavorite: $isFavorite, rating: $rating, name: $name, location: $location, price: $price, details: $details, specs: $specs)';
  }
}

class RecommendedPropertyService {
  static List<RecommendedHomes> getRecommendedProperties() {
    return [
      RecommendedHomes(
        id: '1',
        rating: 4.95,
        name: 'Pebble Creek Haven',
        location: 'Plot 18, Blessing Estate, Ibadan',
        details:
            'A beautiful, modern apartment in the heart of downtown. Recently renovated with high-end finishes and appliances. Featuring an open floor plan, large windows providing plenty of natural light, and a spacious balcony with city views. Building amenities include a fitness center, rooftop lounge, and 24-hour concierge service.',
        price: 2.2,
        isFavorite: false,
        image: 'assets/images/Pebble Creek Haven.jpg',
        specs: ['3 Bedrooms', '2 Baths', '1,200 sqft'],
      ),

      RecommendedHomes(
        id: '2',
        rating: 4.95,
        name: 'Blue Sky Villas',
        location: '12 Olabisi Close, Lagos',
        details:
            'A beautiful, modern apartment in the heart of downtown. Recently renovated with high-end finishes and appliances. Featuring an open floor plan, large windows providing plenty of natural light, and a spacious balcony with city views. Building amenities include a fitness center, rooftop lounge, and 24-hour concierge service.',
        price: 1.25,
        isFavorite: false,
        image: 'assets/images/Blue Sky Villas.jpg',
        specs: ['3 Bedrooms', '2 Baths', '1,200 sqft'],
      ),
    ];
  }

  static Future<List<RecommendedHomes>> getProperties() async {
    await Future.delayed(const Duration(seconds: 2));
    return getRecommendedProperties();
  }
}

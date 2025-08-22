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
    );
  }

  @override
  String toString() {
    return 'Property(id: $id, image: $image, isFavorite: $isFavorite, rating: $rating, name: $name, location: $location, imageUrls: $imageUrls, price: $price, details: $details)';
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
      ),
    ];
  }

  static Future<List<Property>> getProperties() async {
    await Future.delayed(const Duration(seconds: 2));
    return getSampleProperties();
  }
}

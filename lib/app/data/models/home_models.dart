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
  final String landLordName;
  final String landLordImage;
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
    required this.landLordName,
    required this.landLordImage,
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
    'landLordName': landLordName,
    'landLordImage': landLordImage,
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
    landLordName: json['landLordName'] ?? '',
    landLordImage: json['landLordImage'] ?? '',
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
    String? landLordName,
    String? landLordImage,
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
      landLordName: landLordName ?? this.landLordName,
      landLordImage: landLordImage ?? this.landLordImage,
    );
  }

  @override
  String toString() {
    return 'Property(id: $id, image: $image, isFavorite: $isFavorite, rating: $rating, name: $name, location: $location, imageUrls: $imageUrls, price: $price, details: $details, specs: $specs, landLordName: $landLordName, landLordImage: $landLordImage)';
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
        landLordName: 'John Oliver',
        landLordImage:
            'https://images.pexels.com/photos/33811005/pexels-photo-33811005.jpeg',
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
        landLordName: 'Sarah Johnson',
        landLordImage:
            'https://images.pexels.com/photos/33774874/pexels-photo-33774874.jpeg',
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
        landLordName: 'Michael Smith',
        landLordImage:
            'https://images.pexels.com/photos/33799456/pexels-photo-33799456.jpeg',
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
        landLordName: 'Emily Davis',
        landLordImage:
            'https://images.pexels.com/photos/19091621/pexels-photo-19091621.jpeg',
      ),
    ];
  }

  static Future<List<Property>> getProperties() async {
    await Future.delayed(const Duration(seconds: 2));
    return getSampleProperties();
  }
}

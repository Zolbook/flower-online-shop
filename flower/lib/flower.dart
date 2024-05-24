class Flower {
  final int id;
  final String name;
  final String image_url;
  final double rating;
  final String description;
  final String type;
  final int price;

  Flower({
    required this.id,
    required this.name,
    required this.image_url,
    required this.rating,
    required this.description,
    required this.type,
    required this.price
  });

  factory Flower.fromJson(Map<String, dynamic> json) {
    String imageUrl = json['image_url'].replaceAll('http://localhost:3008', 'http://10.0.2.2:3008');
    return Flower(
      id: json['id'],
      name: json['name'],
      image_url: imageUrl,
      rating: json['rating'].toDouble(),
      description: json['description'],
      type: json['type'],
      price: json['price']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': image_url,
      'rating': rating,
      'description': description,
      'type': type,
      'price': price
    };
  }
}


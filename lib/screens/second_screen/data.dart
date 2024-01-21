class RoomModel {
  int id;
  String name;
  int price;
  String pricePer;
  List<String> peculiarities;
  List<String> imageUrls;

  RoomModel({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      pricePer: json['price_per'],
      peculiarities: List<String>.from(json['peculiarities']),
      imageUrls: List<String>.from(json['image_urls']),
    );
  }
}

class Hotel {
  List<RoomModel> rooms;

  Hotel({required this.rooms});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      rooms: List<RoomModel>.from(
          json['rooms'].map((room) => RoomModel.fromJson(room))),
    );
  }
}

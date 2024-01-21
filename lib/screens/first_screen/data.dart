class TourModel {
  final int id;
  final String hotelName;
  final String hotelAdress;
  final int hoRating;
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final int numberOfNights;
  final String room;
  final String nutrition;
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;

  TourModel({
    this.id = 0,
    this.hotelName = '',
    this.hotelAdress = '',
    this.hoRating = 0,
    this.ratingName = '',
    this.departure = '',
    this.arrivalCountry = '',
    this.tourDateStart = '',
    this.tourDateStop = '',
    this.numberOfNights = 0,
    this.room = '',
    this.nutrition = '',
    this.tourPrice = 0,
    this.fuelCharge = 0,
    this.serviceCharge = 0,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) {
    return TourModel(
      id: json['id'] as int,
      hotelName: json['hotel_name'] as String,
      hotelAdress: json['hotel_adress'] as String,
      hoRating: json['horating'] as int,
      ratingName: json['rating_name'] as String,
      departure: json['departure'] as String,
      arrivalCountry: json['arrival_country'] as String,
      tourDateStart: json['tour_date_start'] as String,
      tourDateStop: json['tour_date_stop'] as String,
      numberOfNights: json['number_of_nights'] as int,
      room: json['room'] as String,
      nutrition: json['nutrition'] as String,
      tourPrice: json['tour_price'] as int,
      fuelCharge: json['fuel_charge'] as int,
      serviceCharge: json['service_charge'] as int,
    );
  }
}

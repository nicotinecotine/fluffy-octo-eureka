import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_to_n_company/api/api_client.dart';
import 'package:test_assignment_to_n_company/screens/first_screen/data.dart';

class TourCubit extends Cubit<int> {
  TourCubit() : super(0);

  TourModel? tourData;

  Future<TourModel> getTourInfo() async {
    tourData = await ApiClient().fetchTourData();
    return tourData!;
  }
}

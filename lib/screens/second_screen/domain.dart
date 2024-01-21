import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_to_n_company/api/api_client.dart';
import 'package:test_assignment_to_n_company/screens/second_screen/data.dart';

class RoomCubit extends Cubit<int> {
  RoomCubit() : super(0);

  Hotel? roomData;

  Future<Hotel> getRoomInfo() async {
    roomData = await ApiClient().fetchRoomData();
    return roomData!;
  }
}

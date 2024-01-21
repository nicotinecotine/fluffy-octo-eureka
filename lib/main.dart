import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_to_n_company/screens/first_screen/domain.dart';
import 'package:test_assignment_to_n_company/screens/second_screen/domain.dart';
import 'package:test_assignment_to_n_company/screens/my_material_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TourCubit>(create: (context) => TourCubit()),
        BlocProvider<RoomCubit>(create: (context) => RoomCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

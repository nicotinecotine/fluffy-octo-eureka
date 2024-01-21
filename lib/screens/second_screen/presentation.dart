import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_assignment_to_n_company/screens/first_screen/domain.dart';
import 'package:test_assignment_to_n_company/screens/second_screen/domain.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tourCubit = context.watch<TourCubit>();
    final roomCubit = context.watch<RoomCubit>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        248,
        248,
        248,
      ),
      appBar: AppBar(
        title: Text(
          tourCubit.tourData!.hotelName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            color: Colors.black,
            CupertinoIcons.chevron_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
          future: roomCubit.getRoomInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(13, 114, 255, 1),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider.builder(
                            itemCount: 3,
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              height: 257,
                              autoPlay: true,
                              autoPlayInterval: const Duration(
                                seconds: 5,
                              ),
                            ),
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    roomCubit
                                        .roomData!.rooms[0].imageUrls[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 8,
                          ),
                          child: Text(
                            roomCubit.roomData!.rooms[0].name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          height: 29,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(
                                    130,
                                    135,
                                    150,
                                    0.05,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      roomCubit
                                          .roomData!.rooms[0].peculiarities[0],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color.fromRGBO(130, 135, 150, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(
                                    130,
                                    135,
                                    150,
                                    0.05,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      roomCubit
                                          .roomData!.rooms[0].peculiarities[1],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color.fromRGBO(
                                          130,
                                          135,
                                          150,
                                          1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Container(
                            height: 29,
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 140,
                            ),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(
                                13,
                                114,
                                255,
                                0.1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 11,
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    'Подробнее о номере',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color.fromRGBO(
                                        13,
                                        114,
                                        255,
                                        1,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.chevron_forward,
                                    color: Color.fromRGBO(
                                      13,
                                      114,
                                      255,
                                      1,
                                    ),
                                    size: 24,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 8,
                            left: 16,
                            right: 16,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${roomCubit.roomData!.rooms[0].price ~/ 1000} ${roomCubit.roomData!.rooms[0].price % 1000} ₽',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  bottom: 4,
                                ),
                                child: Text(
                                  roomCubit.roomData!.rooms[0].pricePer
                                      .toLowerCase(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(130, 135, 150, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/third');
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(13, 114, 255, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                child: Text(
                                  'Выбрать номер',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider.builder(
                            itemCount: 3,
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                              height: 257,
                              autoPlay: true,
                              autoPlayInterval: const Duration(
                                seconds: 5,
                              ),
                            ),
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    roomCubit.roomData!.rooms[0]
                                        .imageUrls[2 - index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 8,
                          ),
                          child: Text(
                            roomCubit.roomData!.rooms[1].name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          height: 29,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(
                                    130,
                                    135,
                                    150,
                                    0.05,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      roomCubit
                                          .roomData!.rooms[1].peculiarities[0],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color.fromRGBO(130, 135, 150, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(
                                    130,
                                    135,
                                    150,
                                    0.05,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      roomCubit
                                          .roomData!.rooms[1].peculiarities[1],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color.fromRGBO(
                                          130,
                                          135,
                                          150,
                                          1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: null,
                          child: Container(
                            height: 29,
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 140,
                            ),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(
                                13,
                                114,
                                255,
                                0.1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 11,
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    'Подробнее о номере',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color.fromRGBO(
                                        13,
                                        114,
                                        255,
                                        1,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.chevron_forward,
                                    color: Color.fromRGBO(
                                      13,
                                      114,
                                      255,
                                      1,
                                    ),
                                    size: 24,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 8,
                            left: 16,
                            right: 16,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${roomCubit.roomData!.rooms[1].price ~/ 1000} ${roomCubit.roomData!.rooms[1].price % 1000} ₽',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  bottom: 4,
                                ),
                                child: Text(
                                  roomCubit.roomData!.rooms[1].pricePer
                                      .toLowerCase(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(130, 135, 150, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/third');
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(13, 114, 255, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                child: Text(
                                  'Выбрать номер',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              );
            }
          }),
    );
  }
}

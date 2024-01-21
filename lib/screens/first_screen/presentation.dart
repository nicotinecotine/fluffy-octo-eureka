import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_assignment_to_n_company/screens/first_screen/domain.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tourCubit = context.watch<TourCubit>();
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text(
          "Отель",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: tourCubit.getTourInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(13, 114, 255, 1),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                      itemCount: 5,
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        height: 257,
                        autoPlay: true,
                        autoPlayInterval: const Duration(
                          seconds: 6,
                        ),
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          margin: const EdgeInsets.all(16),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            child: Image.asset(
                              'assets/images/hotel${index + 1}.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          margin: const EdgeInsets.only(
                            right: 181,
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 199, 0, 0.2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: Color.fromRGBO(
                                  255,
                                  168,
                                  0,
                                  1,
                                ),
                              ),
                              Text(
                                '${tourCubit.tourData?.hoRating} ${tourCubit.tourData?.ratingName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color.fromRGBO(
                                    255,
                                    168,
                                    0,
                                    1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            '${tourCubit.tourData?.hotelName}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: Text(
                            '${tourCubit.tourData?.hotelAdress}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(13, 114, 255, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 14,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'от ${tourCubit.tourData!.tourPrice ~/ 1000} ${tourCubit.tourData!.tourPrice % 1000} ₽',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  bottom: 4,
                                ),
                                child: Text(
                                  'за тур с перелётом',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(130, 135, 150, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 14,
                            bottom: 14,
                          ),
                          child: Text(
                            'Об отеле',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '3-я линия',
                                    style: TextStyle(
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
                                right: 20,
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Платный Wi-Fi в фойе',
                                    style: TextStyle(
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
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '30 км до аэропорта',
                                    style: TextStyle(
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              margin: const EdgeInsets.only(
                                right: 20,
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
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '1 км до пляжа',
                                    style: TextStyle(
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
                        Container(
                          padding: const EdgeInsets.only(top: 16, bottom: 10),
                          child: Text(
                            '${tourCubit.tourData!.hotelName}. ${tourCubit.tourData!.room}. ${tourCubit.tourData!.numberOfNights} ночей. ${tourCubit.tourData!.nutrition}.',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/emoji-happy.svg',
                                height: 24,
                                width: 24,
                              ),
                              title: const Text(
                                'Удобства',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(44, 48, 53, 1),
                                ),
                              ),
                              subtitle: const Text(
                                'Самое необходимое',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(
                                    130,
                                    135,
                                    150,
                                    1,
                                  ),
                                ),
                              ),
                              trailing: const Icon(
                                CupertinoIcons.chevron_forward,
                              ),
                            ),
                            ListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/tick-square.svg',
                                height: 24,
                                width: 24,
                              ),
                              title: const Text(
                                'Что включено',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(44, 48, 53, 1),
                                ),
                              ),
                              subtitle: const Text(
                                'Самое необходимое',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(
                                    130,
                                    135,
                                    150,
                                    1,
                                  ),
                                ),
                              ),
                              trailing: const Icon(
                                CupertinoIcons.chevron_forward,
                              ),
                            ),
                            ListTile(
                              leading: SvgPicture.asset(
                                'assets/icons/close-square.svg',
                                height: 24,
                                width: 24,
                              ),
                              title: const Text(
                                'Что не включено',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(44, 48, 53, 1),
                                ),
                              ),
                              subtitle: const Text(
                                'Самое необходимое',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(
                                    130,
                                    135,
                                    150,
                                    1,
                                  ),
                                ),
                              ),
                              trailing: const Icon(
                                CupertinoIcons.chevron_forward,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
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
                            'К выбору номера',
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
                  const SizedBox(height: 16),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

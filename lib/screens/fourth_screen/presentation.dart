import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Заказ оплачен',
          style: TextStyle(
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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/first');
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
                    'Супер!',
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
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  255,
                  248,
                  248,
                  248,
                ),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Image.asset(
                'assets/images/party.png',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Ваш заказ принят в работу',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 47,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Подтвержение заказа №${Random().nextInt(100000)} может занять некоторое время (от 1 часа до суток).',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(130, 135, 150, 1),
                    ),
                  ),
                  const Text(
                    'Как только мы получим ответ от туроператора, вам на почту придёт уведомление.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(130, 135, 150, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

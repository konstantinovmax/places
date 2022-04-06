import 'package:flutter/material.dart';

class SightDetails extends StatelessWidget {
  const SightDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 360.0,
            color: Colors.red,
          ),
          const SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Text(
                  'Название достопримечательности',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 24.0,
                    height: 1.25,
                    color: Color(0xFF3B3E5B),
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: const [
                    Text(
                      'тип достопримечательности',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        height: 1.25,
                        color: Color(0xFF3B3E5B),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'время работы',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        height: 1.25,
                        color: Color(0xFF7C7E92),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
                const Text(
                  'Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    height: 1.25,
                    color: Color(0xFF3B3E5B),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                  height: 48.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => const Color(0xFF4CAF50),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('res/icons/direction_icon.png'),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          'Построить маршрут'.toLowerCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                            height: 1.25,
                            letterSpacing: 0.3,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Divider(
                  height: 1.0,
                  thickness: 0.0,
                  color: const Color(0xFF7C7E92).withOpacity(0.6),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset('res/icons/calendar_icon.png'),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'Запланировать',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                height: 1.25,
                                letterSpacing: 0.3,
                                color: const Color(0xFF7C7E92).withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              'res/icons/heart_icon.png',
                              color: const Color(0xFF3B3E5B),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Text(
                              'В Избранное',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                height: 1.25,
                                letterSpacing: 0.3,
                                color: Color(0xFF3B3E5B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

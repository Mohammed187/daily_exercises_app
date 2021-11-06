import 'package:daily_exercise_app/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/category_card.dart';
import 'widgets/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kTextColor,
            ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Color(0xfff5ce88),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xfff2bea1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  Text(
                    'Good Morning, \nMuhammed.',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        CategoryCard(
                          svgSrc: 'assets/icons/Hamburger.svg',
                          title: 'Diet Recommendations',
                          onPressed: () {},
                        ),
                        CategoryCard(
                          svgSrc: 'assets/icons/Excrecises.svg',
                          title: 'Kegel Exercises',
                          onPressed: () {},
                        ),
                        CategoryCard(
                          svgSrc: 'assets/icons/Meditation.svg',
                          title: 'Meditation',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(),
                              ),
                            );
                          },
                        ),
                        CategoryCard(
                          svgSrc: 'assets/icons/yoga.svg',
                          title: 'Yoga',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

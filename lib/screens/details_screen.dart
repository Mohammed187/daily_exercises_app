import 'package:daily_exercise_app/constants.dart';
import 'package:daily_exercise_app/widgets/bottom_nav_bar.dart';
import 'package:daily_exercise_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

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
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage('assets/images/meditation_bg.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      'Meditation',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '3-10 MINS Course',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        'Live happier and healthier by learning the fundmentals of meditation and mindfulness.',
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SessionCard(
                          sessionNum: 1,
                          isDone: true,
                          onPressed: () {},
                        ),
                        SessionCard(
                          sessionNum: 2,
                          onPressed: () {},
                        ),
                        SessionCard(
                          sessionNum: 3,
                          onPressed: () {},
                        ),
                        SessionCard(
                          sessionNum: 4,
                          onPressed: () {},
                        ),
                        SessionCard(
                          sessionNum: 5,
                          onPressed: () {},
                        ),
                        SessionCard(
                          sessionNum: 6,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Meditation',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Meditation_women_small.svg',
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Basic 2',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                Text('Start your deepen practice'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset('assets/icons/Lock.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  const SessionCard({
    Key? key,
    required this.sessionNum,
    this.isDone = false,
    required this.onPressed,
  }) : super(key: key);

  final int sessionNum;
  final bool isDone;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraints.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Session 0$sessionNum',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

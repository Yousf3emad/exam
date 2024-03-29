import 'package:exam/models/workout_model.dart';
import 'package:exam/services/assets_manager.dart';
import 'package:exam/widgets/custom_tab.dart';
import 'package:exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../widgets/custom_workout_container.dart';
import 'care_screen.dart';

class WorkOutScreen extends StatefulWidget {
  const WorkOutScreen({super.key});

  static String routeName = "WorkOutScreen";
  @override
  State<WorkOutScreen> createState() => _WorkOutScreenState();
}

class _WorkOutScreenState extends State<WorkOutScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetsManager.profile,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Jade",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "Ready to workout?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Badge(
                          child: Icon(Icons.notifications_none_outlined))),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                width: size.width,
                padding: const EdgeInsets.all(10),
                color: const Color(0xffF8F9FC),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: customWorkoutContainer(
                          context: context,
                          icon: IconlyLight.heart,
                          titleTxt: "Heart Rate",
                          subTitleTxt: "81BPM"),
                      onTap: () {
                        Navigator.pushNamed(context, CareScreen.routeName);
                      },
                    ),
                    const SizedBox(
                      height: 60,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                    customWorkoutContainer(
                        context: context,
                        icon: Icons.list,
                        titleTxt: "To-do",
                        subTitleTxt: "32.5%"),
                    const SizedBox(
                      height: 60,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                    customWorkoutContainer(
                        context: context,
                        isImage: true,
                        img: AssetsManager.calories,
                        titleTxt: "Calo",
                        subTitleTxt: "1000Cal"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: titleWidget(txt: "Workout Programs"),
              ),
              TabBar(
                controller: tabController,
                tabs: [
                  FittedBox(child: customTab(txt: "All Type")),
                  FittedBox(child: customTab(txt: "Full Body")),
                  FittedBox(child: customTab(txt: "Upper")),
                  FittedBox(child: customTab(txt: "Lower")),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) => FittedBox(
                      child: Container(
                        height: size.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffF8F9FC),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      "${listWorkoutModel[index].daysNum} days",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  titleWidget(
                                      txt: listWorkoutModel[index].title),
                                  SizedBox(
                                    width: 170,
                                    child: FittedBox(
                                        child: titleWidget(
                                            txt: listWorkoutModel[index]
                                                .subTitle,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      children: [
                                        Icon(IconlyLight.time_circle),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text("30 mins"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              listWorkoutModel[index].img,
                              height: size.width * .4,
                              width: size.width * 0.4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    itemCount: listWorkoutModel.length,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color(0xff0b5e11),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: bottomNavBarItems,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_filled,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.navigation,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.bar_chart,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          IconlyLight.profile,
        ),
        label: ""),
  ];

  List<WorkoutModel> listWorkoutModel = [
    WorkoutModel(
        daysNum: 7,
        title: "Morning Yoga",
        subTitle: "Improve mental focus.",
        img: AssetsManager.morningYoga),
    WorkoutModel(
        daysNum: 3,
        title: "Plank Exercise",
        subTitle: "Improve posture and stability.",
        img: AssetsManager.plankExercise),
  ];
}

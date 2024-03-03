import 'package:exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../models/workout_model.dart';
import '../services/assets_manager.dart';

class CareScreen extends StatefulWidget {
  const CareScreen({super.key});

  static String routeName = "CareScreen";
  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> with TickerProviderStateMixin {
  int currentIndex = 0;
  int selectedTab = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.animateTo(2);
  }

  List<WorkoutModel> listWorkoutModel = [
    WorkoutModel(
        daysNum: 7,
        title: "Morning Yoga",
        subTitle: "Improve mental focus.",
        img: AssetsManager.morningYoga),
    WorkoutModel(
        daysNum: 7,
        title: "Morning Yoga",
        subTitle: "Improve mental focus.",
        img: AssetsManager.plankExercise),
    WorkoutModel(
        daysNum: 7,
        title: "Morning Yoga",
        subTitle: "Improve mental focus.",
        img: AssetsManager.morningYoga),
    WorkoutModel(
        daysNum: 7,
        title: "Morning Yoga",
        subTitle: "Improve mental focus.",
        img: AssetsManager.plankExercise),
  ];
  List<String> listCateg = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.iconCare),
            titleWidget(txt: "Alice Care")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "article, video, Audio and ,more..",
                    prefixIcon: const Icon(
                      IconlyLight.search,
                      size: 16,
                    )),
              ),
              // SizedBox(
              //   height: 60.0,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) => Container(
              //         margin: EdgeInsets.symmetric(vertical: 8),
              //         padding: EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(30),
              //           color: Color(0xffE4E7EC),
              //         ),
              //         child: titleWidget(txt: "Youssef",fontSize: 16,fontWeight: FontWeight.w500),
              //       ),
              //       separatorBuilder: (context, index) => const SizedBox(width: 8.0,),
              //       itemCount: 3
              //   ),
              // ),
              TabBar(
                onTap: (index) {
                  setState(() {
                    selectedTab = index;
                  });
                },
                splashBorderRadius: BorderRadius.circular(50),
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                isScrollable: true,
                controller: tabController,

                tabs: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedTab == 0
                          ? const Color(0xffF4EBFF)
                          : const Color(0xffE4E7EC),
                    ),
                    child: titleWidget(
                        txt: "Discover",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedTab == 1
                          ? const Color(0xffF4EBFF)
                          : const Color(0xffE4E7EC),
                    ),
                    child: titleWidget(
                        txt: "News", fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedTab == 2
                          ? const Color(0xffF4EBFF)
                          : const Color(0xffE4E7EC),
                    ),
                    child: titleWidget(
                        txt: "Most Viewed",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: selectedTab == 3
                          ? const Color(0xffF4EBFF)
                          : const Color(0xffE4E7EC),
                    ),
                    child: titleWidget(
                        txt: "Saved",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleWidget(txt: "Hot Topics"),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          "See more",
                          style: TextStyle(
                              color: Color(0xff5925DC),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 16,
                          color: Color(0xff5925DC),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        AssetsManager.careBanners[index],
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                    itemCount: AssetsManager.careBanners.length,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              titleWidget(txt: "Get Tips"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  height: 196,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF8F9FC),
                  ),
                  child: SizedBox(
                    width: 360,
                    child: Row(
                      children: [
                        Image.asset(AssetsManager.doctor),
                        Container(
                          margin: const EdgeInsets.all(18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  width: 190,
                                  child: Text(
                                    "Connect with doctors & get suggestions",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        overflow: TextOverflow.ellipsis),
                                  )),
                              const SizedBox(
                                  width: 190,
                                  child: Text(
                                    "Connect now and get expert insights",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis),
                                  )),
                              const SizedBox(
                                height: 12.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff7F56D9)),
                                ),
                                onPressed: () {},
                                child: titleWidget(
                                    txt: "View Details",
                                    fontSize: 14,
                                    txtColor: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleWidget(txt: "Cycle Phases and Period"),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          "See all",
                          style: TextStyle(
                              color: Color(0xff5925DC),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 16,
                          color: Color(0xff5925DC),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
        selectedItemColor: const Color(0xff7F56D9),
        items: const [
           BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: "Today"),
           BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view_outlined,
              ),
              label: "Insights"),
           BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
              ),
              label: "Chat"),
        ],
      ),
    );
  }
}

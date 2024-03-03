import 'package:card_swiper/card_swiper.dart';
import 'package:exam/screens/workout_screen.dart';
import 'package:exam/services/assets_manager.dart';
import 'package:exam/widgets/feeling_widget.dart';
import 'package:exam/widgets/title_widget.dart';
import 'package:exam/widgets/welcome_widget.dart';
import 'package:flutter/material.dart';
import '../models/exercise_grid_element_model.dart';
import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo.png",
        ),
        title: const Text(
          "Mody",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon:
                  const Badge(child: Icon(Icons.notifications_none_outlined))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeWidget(),
              const SizedBox(
                height: 12,
              ),
              fellingWidget(),
              const SizedBox(
                height: 18.0,
              ),
              SizedBox(
                height: size.height * 0.12,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.asset(listFeeling[index].img),
                      Text(listFeeling[index].exp),
                    ],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 30.0,
                  ),
                  itemCount: listFeeling.length,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleWidget(txt: "Feature"),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, WorkOutScreen.routeName);
                    },
                    child: const Row(
                      children: [
                        Text(
                          "See more",
                          style: TextStyle(
                              color: Color(0xff0b5e11),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              //*******
              SizedBox(
                height: (size.width * 0.45),
                child: Swiper(
                  autoplay: true,
                  itemCount: AssetsManager.banners.length,
                  itemBuilder: (context, index) => Image.asset(
                    AssetsManager.bannersS[index],
                  ),
                  onTap: (index) {},
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.green,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleWidget(txt: "Exercise"),
                  const Row(
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(
                            color: Color(0xff0b5e11),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 150,
                width: size.width,
                child: GridView.builder(
                  padding: const EdgeInsets.all(6),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 60,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(12),
                    height: 60,
                    decoration: BoxDecoration(
                      color: listExercise[index].bgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Image.asset(listExercise[index].img),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(listExercise[index].txt)
                      ],
                    ),
                  ),
                  itemCount: listExercise.length,
                ),
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
        selectedItemColor: const Color(0xff0b5e11),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: bottomNavBarItems,
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
          Icons.grid_view_outlined,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.calendar_today,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline_rounded,
        ),
        label: ""),
  ];

  List<FeelingModel> listFeeling = [
    FeelingModel(img: AssetsManager.love, exp: "Love"),
    FeelingModel(img: AssetsManager.cool, exp: "Cool"),
    FeelingModel(img: AssetsManager.happy, exp: "Happy"),
    FeelingModel(img: AssetsManager.sad, exp: "Sad"),
  ];

  List<ExerciseGridElementModel> listExercise = [
    ExerciseGridElementModel(
      img: AssetsManager.relaxing,
      txt: "Relaxing",
      bgColor: const Color(0xffF9F5FF),
    ),
    ExerciseGridElementModel(
      img: AssetsManager.meditation,
      txt: "Meditation",
      bgColor: const Color(0xffFDF2FA),
    ),
    ExerciseGridElementModel(
      img: AssetsManager.breathing,
      txt: "Breathing",
      bgColor: const Color(0xffFFFAF5),
    ),
    ExerciseGridElementModel(
      img: AssetsManager.yoga,
      txt: "Yoga",
      bgColor: const Color(0xffF0F9FF),
    ),
  ];
}

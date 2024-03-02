import 'package:exam/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../models/workout_model.dart';
import '../services/assets_manager.dart';

class CareScreen extends StatefulWidget {
   CareScreen({super.key});

   static String routeName = "CareScreen";
  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {
  int currentIndex = 0;

  List<WorkoutModel> listWorkoutModel = [
    WorkoutModel(daysNum: 7, title: "Morning Yoga", subTitle: "Improve mental focus.", img: AssetsManager.morningYoga),
    WorkoutModel(daysNum: 7, title: "Morning Yoga", subTitle: "Improve mental focus.", img: AssetsManager.plankExercise),
    WorkoutModel(daysNum: 7, title: "Morning Yoga", subTitle: "Improve mental focus.", img: AssetsManager.morningYoga),
    WorkoutModel(daysNum: 7, title: "Morning Yoga", subTitle: "Improve mental focus.", img: AssetsManager.plankExercise),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: titleWidget(txt: "Alice Care"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                  hintText: "article, video,",prefixIcon: Icon(IconlyLight.search,size: 16,)),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleWidget(txt: "Hot Topics"),
                GestureDetector(
                  onTap: (){
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AssetsManager.careBanners[index],
                  separatorBuilder: (context, index) => const SizedBox(width: 20,),
                  itemCount: AssetsManager.careBanners.length,
                ),
              ),
            ),
            SizedBox(height: 20,),
            titleWidget(txt: "Get Tips"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
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
                                child: Text("${listWorkoutModel[index].daysNum} days",textAlign: TextAlign.center,),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              titleWidget(txt: listWorkoutModel[index].title),
                              titleWidget(txt: listWorkoutModel[index].subTitle,fontSize: 16,fontWeight: FontWeight.w400),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  children: [
                                    Icon(IconlyLight.time_circle),
                                    SizedBox(width: 6,),
                                    Text("30 mins"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(listWorkoutModel[index].img,height: 150,width: 150,),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(width: 20,),
                  itemCount: listWorkoutModel.length,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleWidget(txt: "Cycle Phases and Period"),
                GestureDetector(
                  onTap: (){
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xff7F56D9),
        items: [
           const BottomNavigationBarItem(icon: Icon(Icons.calendar_today,),label: "Today"),
          const BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined,),label: "Insights"),
          const BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline,),label: "Chat"),
        ],
      ),
    );
  }
}

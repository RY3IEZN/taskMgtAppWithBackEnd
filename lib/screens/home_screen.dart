import 'package:flutter/material.dart';
import 'package:tskmgt_withbcknd/screens/all_tasks.dart';
import 'package:tskmgt_withbcknd/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/welcome.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                    color: Color(0xFF202e59),
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "\nStart your beautiful day",
                    style: TextStyle(color: Color(0xFF202e59), fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400,
            ),
            ButtonWidget(
                bgcolor: Color(0xFF202e59),
                text: "Add Task",
                textColor: Colors.white),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AllTasks(), transition: Transition.cupertino);
              },
              child: ButtonWidget(
                  bgcolor: Colors.white,
                  text: "View All",
                  textColor: Color(0xFF202e59)),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tskmgt_withbcknd/widgets/button_widget.dart';
import 'package:tskmgt_withbcknd/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List myData = ["try again", "try your luck", "try harder"];

    final leftEditIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey,
      child: Icon(Icons.edit),
      alignment: Alignment.centerLeft,
    );

    final rightDeleteIcon = Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.red,
      child: Icon(Icons.delete),
      alignment: Alignment.centerRight,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            height: MediaQuery.of(context).size.height / 3.2,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/header1.jpg"),
              ),
            ),
            child: Icon(Icons.arrow_back),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  size: 30,
                  color: Color(0xFF202e59),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 25,
                  height: 25,
                  child: Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF202e59),
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Color(0xFF202e59),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "2",
                  style: TextStyle(fontSize: 20, color: Color(0xFF202e59)),
                )
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightDeleteIcon,
                  key: ObjectKey(index),
                  onDismissed: (DismissDirection direction) {
                    print("gone");
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                  color: Color(0xFF2e3253).withOpacity(0.4),
                                ),
                                height: 300,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonWidget(
                                        bgcolor: Color(0xFF202e59),
                                        text: "View",
                                        textColor: Colors.white),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ButtonWidget(
                                        bgcolor: Color(0xFF202e59),
                                        text: "View",
                                        textColor: Colors.white),
                                  ],
                                ));
                          });
                      print("about to go");
                      return false;
                    } else {
                      return Future.delayed(Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child:
                        TaskWidget(color: Colors.indigo, text: myData[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

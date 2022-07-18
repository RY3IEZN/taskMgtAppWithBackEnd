import 'package:flutter/material.dart';
import 'package:tskmgt_withbcknd/widgets/button_widget.dart';
import 'package:tskmgt_withbcknd/widgets/textfield_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailsController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: const AssetImage("assets/images/addtask1.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                SizedBox(
                  height: 50,
                ),
                Icon(Icons.arrow_back)
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    hintText: "Task details",
                    borderRadius: 20,
                    textController: nameController),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    hintText: "Task details",
                    maxLines: 4,
                    borderRadius: 20,
                    textController: detailsController),
                SizedBox(height: 20),
                ButtonWidget(
                    bgcolor: Colors.indigo,
                    text: "Add",
                    textColor: Colors.white),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

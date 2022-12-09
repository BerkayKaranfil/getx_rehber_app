import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_rehber_app/controller/data_controller.dart';
import 'package:getx_rehber_app/model/contact_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactScreen extends StatelessWidget {
  // const ContactScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final DataController dataController = Get.find<DataController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Contact"),
      ),
      body: Container(
        width: 100.w,
        padding: EdgeInsets.only(right: 5.w, left: 5.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.w)),
                  hintText: "Enter Your Name"),
            ),
            SizedBox(
              height: 5.h,
            ),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.w)),
                  hintText: "Enter Your Phone Number"),
            ),
            SizedBox(
              height: 5.h,
            ),
            TextField(
              controller: emailController,
             // keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.w)),
                  hintText: "Enter Your Email"),
            ),
            SizedBox(
              height: 2.h,
            ),
            ElevatedButton(
                onPressed: () {
                  ContactModel model = ContactModel(phone: phoneController.text, email: emailController.text, name: nameController.text);
                  dataController.addContact(model);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, )),
            
          ],
        ),
      ),
    );
  }
}

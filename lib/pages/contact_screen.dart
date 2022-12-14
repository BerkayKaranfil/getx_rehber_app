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
            TextFormField(
              controller: nameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: ((value) {
                if (!GetUtils.isUsername(value!)) {
                  return "Please enter a valid user name";
                } else {
                  return null;
                }
              }),
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.w)),
                  hintText: "Enter Your Name"),
            ),
            //  CustomTextField(controller: nameController, hintText: "Enter Your Name", textInputType: TextInputType.name),
            SizedBox(
              height: 5.h,
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: ((value) {
                if (!GetUtils.isPhoneNumber(value!)) {
                  return "Please enter a valid phone number";
                } else {
                  return null;
                }
              }),
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.w)),
                  hintText: "Enter Your Phone Number"),
            ),
            //  CustomTextField(controller: phoneController, hintText: "Enter Your Phone Number", textInputType: TextInputType.phone),
            SizedBox(
              height: 5.h,
            ),
            TextFormField(
              // obscureText: true, // Metni g??r??nmez yap??yor (... gibi)
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: ((value) {
                if (!GetUtils.isEmail(value!)) {
                  return "Please enter a valid e-mail address";
                } else {
                  return null;
                }
              }),
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderSide: BorderSide(width: 1.w)),
                  hintText: "Enter Your Email"),
            ),
            // CustomTextField(controller: emailController,hintText: "Enter Your Email",textInputType: TextInputType.emailAddress,),

            SizedBox(
              height: 2.h,
            ),
            ElevatedButton(
                onPressed: () {
                  ContactModel model = ContactModel(
                      phone: phoneController.text,
                      email: emailController.text,
                      name: nameController.text);
                  dataController.addContact(model);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  const CustomTextField({
    Key? key,
    //required this.emailController,
    required this.controller,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  //final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(width: 1.w)),
          hintText: hintText),
    );
  }
}

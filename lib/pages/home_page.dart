import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getx_rehber_app/controller/data_controller.dart';
import 'package:getx_rehber_app/model/contact_model.dart';
import 'package:getx_rehber_app/pages/contact_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final DataController dataController = Get.put(DataController(), permanent: true);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Expanded(
              child: Obx(() => dataController.contacts.value.isNotEmpty ? ListView.builder(
              itemCount: dataController.contacts.value.length,
              itemBuilder: (context, index) {
                ContactModel model = dataController.contacts.value[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 2.w),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(model.name),
                    subtitle: Text(model.phone),
                    trailing: IconButton(
                      onPressed: () {
                        dataController.removeContact(model);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ) : Center(
              child: Text("Henüz Not Eklemedin.", style: TextStyle(fontSize: 4.h),),
            )
            ,
          )),
          ElevatedButton(
              onPressed: () {
                Get.to(() => ContactScreen());
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              )),
              SizedBox(
                height: 20.h,
              )
        ],
      ),
    );
  }
}

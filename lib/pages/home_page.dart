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

  final DataController dataController =
      Get.put(DataController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Expanded(
              child: Obx(
            () => dataController.contacts.value.isNotEmpty
                ? ListView.builder(
                    itemCount: dataController.contacts.value.length,
                    itemBuilder: (context, index) {
                      ContactModel model = dataController.contacts.value[index];

                      return Dismissible(
                        background: Container(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Icon(Icons.delete),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Are you sure you want to delete?",
                                style: TextStyle(
                                    fontSize: 2.h, color: Colors.blueAccent),
                              )
                            ],
                          ),
                        ),
                        key: UniqueKey(),
                        //Key(dataController.contacts.value[index].toString()),
                        onDismissed: (direction) {
                          dataController.removeContact(model);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 2.w),
                          child: ListTile(
                            isThreeLine: true,
                            leading: CircleAvatar(
                              radius: 3.h,
                              child: Icon(Icons.person,size: 4.h,),
                            ),
                            title: Text(model.name, style: TextStyle(fontSize: 2.h),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(model.phone,style: TextStyle(color: Colors.black),),
                                Text(model.email,style: TextStyle(color: Colors.black))
                              ],
                            ),
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
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Henüz Not Eklemedin.",
                      style: TextStyle(fontSize: 4.h),
                    ),
                  ),
          )),
          ElevatedButton(
              onPressed: () {
                Get.to(() => ContactScreen());
              },
              child: Text(
                "Not Ekle",
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

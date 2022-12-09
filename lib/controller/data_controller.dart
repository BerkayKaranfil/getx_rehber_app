import 'package:get/get.dart';
import 'package:getx_rehber_app/model/contact_model.dart';

class DataController extends GetxController{

  var contacts = [].obs;

  addContact(ContactModel contact){
    contacts.add(contact);
    Get.back();
  }

  removeContact(ContactModel contact){
    contacts.remove(contact);
  }
}
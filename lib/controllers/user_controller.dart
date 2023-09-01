import 'package:get/get.dart';
import 'package:status_app/models/user_model.dart';

class UserController extends GetxController {
  var userExist = false.obs;
  var user = User().obs;

  void setUser(User newUser) {
    userExist.value = true;
    user.value = newUser;
  }

  void changeAge(int newAge) {
    user.update((val) {
      val!.age = newAge;
    });
  }

  void addProfession(String profession) {
    user.update((val) {
      val!.professions!.add(profession);
    });
  }

  void clearUser() {
    userExist.value = false;
    user.value = User();
  }
}
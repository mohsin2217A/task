import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxBool searchSelection = false.obs;
  RxBool chatSelection = false.obs;
  RxBool homeSelection = true.obs;
  RxBool likesSelection = false.obs;
  RxBool profileSelection = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void onSearchClick() {
    if (!searchSelection.value) {
      searchSelection.value = true;
      chatSelection.value = false;
      homeSelection.value = false;
      likesSelection.value = false;
      profileSelection.value = false;
    }
  }

  void onChatClick() {
    if (!chatSelection.value) {
      chatSelection.value = true;
      searchSelection.value = false;
      homeSelection.value = false;
      likesSelection.value = false;
      profileSelection.value = false;
    }
  }

  void onHomeClick() {
    if (!homeSelection.value) {
      homeSelection.value = true;
      chatSelection.value = false;
      searchSelection.value = false;
      likesSelection.value = false;
      profileSelection.value = false;
    }
  }

  void onLikesClick() {
    if (!likesSelection.value) {
      likesSelection.value = true;
      searchSelection.value = false;
      homeSelection.value = false;
      chatSelection.value = false;
      profileSelection.value = false;
    }
  }

  void onProfileClick() {
    if (!profileSelection.value) {
      profileSelection.value = true;
      searchSelection.value = false;
      homeSelection.value = false;
      chatSelection.value = false;
      likesSelection.value = false;
    }
  }
}

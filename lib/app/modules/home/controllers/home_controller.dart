import 'package:get/get.dart';

import '../../../data/models/dummy_model.dart';

class HomeController extends GetxController {
  List<DummyModel> list = [
    DummyModel(
        image:
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/317363739.jpg?k=4a62a1a5d5e843d4e757fd1a5ec528ebb5a07eb960d6e111ee9d376250b17d2a&o=&hp=1',
        name: 'Gladkova St.,25'),
    DummyModel(
        image:
            'https://q-xx.bstatic.com/xdata/images/hotel/max500/87616830.jpg?k=d3190f350292713118958a4cbf9d82d44222d6cd6db03014bb248d904c623946&o=',
        name: 'Gulbina St.,25'),
    DummyModel(
        image:
            'https://static.vecteezy.com/system/resources/previews/019/565/236/non_2x/new-modern-complex-of-residential-appartment-in-europe-photo.jpg',
        name: 'Trent bridge St.,25'),
    DummyModel(
        image:
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/546633186.jpg?k=9662c1bb2cb190186706f371ff9278889c003df1c6ebe36154141b8648b9babc&o=&hp=1',
        name: 'Alsaka St.,25'),
  ];

  @override
  void onInit() {
    super.onInit();
  }
}

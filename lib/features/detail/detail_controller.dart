import 'package:get/get.dart';

class DetailController extends GetxController {
  int? maxLines = 3;

  setMaxLine() {
    if (maxLines == 3) {
      maxLines = 10;
    } else {
      maxLines = 3;
    }
    update();
  }

  int? selectedSize = 0;
  changeSelectedSize(int index) {
    selectedSize = index;
    update();
  }
}

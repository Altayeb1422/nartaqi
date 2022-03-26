import 'package:get/get.dart';
import 'package:nartaqi/control/english_books_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishBooksController>(
          () => EnglishBooksController(),
    );
  }
}
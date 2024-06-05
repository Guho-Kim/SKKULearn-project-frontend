import 'package:get/get.dart';

class UserController extends GetxController {
  var username = ''.obs;
  var shares = 0.obs;
  var reply = 0.obs;
  var likes = 0.obs;
  var point = 0.obs;

  void setUser(String user, int userShares, int userReply, int userLikes,
      int userPoint) {
    username.value = user;
    shares.value = userShares;
    reply.value = userReply;
    likes.value = userLikes;
    point.value = userPoint;
  }
}

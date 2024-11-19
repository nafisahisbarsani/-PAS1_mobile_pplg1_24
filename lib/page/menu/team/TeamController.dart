import 'package:get/get.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamApiService.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamModel.dart';

class TeamController extends GetxController{
  var isLoading = true.obs;
  var teamList = <TeamModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await TeamApiService().fetchPosts();
      teamList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}

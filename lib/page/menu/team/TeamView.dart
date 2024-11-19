import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamController.dart';
import '../../../widget/soccer_card.dart';


class TeamView extends StatelessWidget {
  final TeamController postController = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team'),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: postController.teamList.length,
          itemBuilder: (context, index) => SoccerCard(team: postController.teamList[index]),
        );
      }),
    );
  }
}
void main() {
  runApp(GetMaterialApp(
    home: TeamView(),
  ));
}

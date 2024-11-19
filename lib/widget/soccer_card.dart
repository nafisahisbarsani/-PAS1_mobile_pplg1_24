import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_pplg1_24/controller/like_controller.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamController.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamModel.dart';
import 'package:pas1_mobile_pplg1_24/widget/my_color.dart';
import 'package:pas1_mobile_pplg1_24/widget/my_text.dart';


class SoccerCard extends StatelessWidget {
  final TeamController teamController = Get.put(TeamController());
  final Likecontroller likeController = Get.put(Likecontroller());
  final TeamModel team;
  bool allowDeletion = false;

  SoccerCard({required this.team, super.key, this.allowDeletion = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
              team.strBadge,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: team.strTeam, color: textColor, fontsize: 14, fontWeight: FontWeight.normal),
                  SizedBox(height: 8),
                  MyText(text: team.strLocation, color: textColor, fontsize: 14, fontWeight: FontWeight.normal),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Obx(() {
                      var isLiked = likeController.getLikedById(team.idTeam!).value;
                      return IconButton(
                          onPressed: () {
                            if (isLiked) {
                              if (allowDeletion) {
                                likeController.deleteTask(team.idTeam!);
                                Get.snackbar(
                                    'Info', '${team!.strTeam} removed from favorites.',
                                    backgroundColor: Colors.white,
                                    colorText: Colors.black);
                              } else {
                                Get.snackbar(
                                    'Error', 'You can only remove favorites from Library.',
                                    backgroundColor: Colors.white,
                                    colorText: Colors.black);
                              }
                            } else {
                              likeController.addTask(team!);
                              Get.snackbar(
                                  'Info', '${team!.strTeam} added to favorites.',
                                  backgroundColor: Colors.white, colorText: Colors.black);
                            }
                          },
                          icon: Icon(
                            isLiked ? Icons.bookmark : Icons.bookmark_border,
                            color: isLiked ? Colors.black : Colors.black,
                            size: 24,
                          ));
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

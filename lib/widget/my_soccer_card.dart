import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_pplg1_24/controller/favorit_controller.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamController.dart';
import 'package:pas1_mobile_pplg1_24/page/menu/team/TeamModel.dart';
import 'package:pas1_mobile_pplg1_24/widget/my_color.dart';
import 'package:pas1_mobile_pplg1_24/widget/my_text.dart';

class SoccerCard extends StatelessWidget {
  final TeamController teamController = Get.put(TeamController());
  final Favoritcontroller favoritcontroller = Get.put(Favoritcontroller());
  final TeamModel team;
  bool allowDeletion = false;

  final RxBool isExpanded = false.obs;

  SoccerCard({required this.team, super.key, this.allowDeletion = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isExpanded.toggle();
      },
      child: Card(
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
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: team.strTeam,
                            color: textColor,
                            fontsize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() {
                          var isLiked = favoritcontroller.getLikedById(team.idTeam!).value;
                          return IconButton(
                            onPressed: () {
                              if (isLiked) {
                                // If it's already in favorites, remove it
                                favoritcontroller.deleteTask(team.idTeam!);
                                Get.snackbar(
                                  'Info', '${team.strTeam} removed from favorites.',
                                  backgroundColor: Colors.white,
                                  colorText: Colors.black,
                                );
                              } else {
                                // If it's not in favorites, add it
                                favoritcontroller.addTask(team);
                                Get.snackbar(
                                  'Info', '${team.strTeam} added to favorites.',
                                  backgroundColor: Colors.white,
                                  colorText: Colors.black,
                                );
                              }
                            },
                            icon: Icon(
                              isLiked ? Icons.bookmark : Icons.bookmark_border, // Toggle between filled and outline bookmark icon
                              color: isLiked ? Colors.black : Colors.black,
                              size: 24,
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(height: 5),
                    Obx(() {
                      // Show full or truncated description based on isExpanded
                      return MyText(
                        text: team.strDescriptionEN,
                        color: textColor,
                        fontsize: 14,
                        fontWeight: FontWeight.normal,
                        maxLines: isExpanded.value ? null : 3, // null for full description
                        overflow: isExpanded.value
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      );
                    }),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

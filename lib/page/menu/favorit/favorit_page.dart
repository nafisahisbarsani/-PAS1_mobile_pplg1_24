import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/favorit_controller.dart';
import '../../../widget/my_soccer_card.dart';

class FavoritPage extends StatelessWidget {
  final Favoritcontroller favoritcontroller = Get.put(Favoritcontroller());
  FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
    favoritcontroller.loadTasks();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit'),
      ),
      body: Obx(() {
        if (favoritcontroller.tasks.isEmpty) {
          return Center(
            child: Text('Tidak ada Club yang disukai',
                style: TextStyle(color: Colors.black)),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: favoritcontroller.tasks.length,
          itemBuilder: (context, index) {
            final dataSoccer = favoritcontroller.tasks[index];
            return SoccerCard(
              team: dataSoccer,
              allowDeletion: true, // Pass the liked song data to MusicCard
            );
          },
        );

      }),
    );
  }
}

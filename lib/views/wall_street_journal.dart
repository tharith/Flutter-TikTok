import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/wall_street_journal_controller.dart';

class WallStreetJournal extends StatelessWidget {
  WallStreetJournal({Key? key}) : super(key: key);

  var controller = Get.put(WallStreetJournalController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wall Street Journal"),
      ),
      body: Obx(
          () => ListView.builder(
            itemCount: controller.lsArticles.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${controller.lsArticles[index].urlToImage}"),
                  ),
                  title: Text("${controller.lsArticles[index].title}"),
                  subtitle: Text("${controller.lsArticles[index].description}"),
                ),
              );
            },
          )
      ),
    );
  }
}

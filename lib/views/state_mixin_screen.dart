import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../controllers/state_mixin_controller.dart';

class StateMixinScreen extends GetView<StateMixinController> {
  StateMixinScreen({Key? key}) : super(key: key);
  final con = Get.put(StateMixinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Mixin Screen"),
      ),
      body: controller.obx(
          (data) => RefreshIndicator(
            onRefresh: () async {
              controller.getBusinessHeadlineInfo();
            },
            child: ListView.builder(
              itemCount: data?.articles!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    data!.articles![index].urlToImage == null
                      ? const SizedBox()
                      : Image.network("${data!.articles![index].urlToImage}"),
                    const SizedBox(height: 10.0,),
                    Text(
                      "${data!.articles![index].title}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(data.articles![index].description ?? ''),
                    Text(data.articles![index].author ?? '')
                  ],
                );
              },
            ),
          )
      ),
    );
  }
}

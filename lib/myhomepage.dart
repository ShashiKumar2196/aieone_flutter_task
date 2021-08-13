import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/app_controller.dart';


class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return controller.dataLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.getData.length,
                    itemBuilder: (context, index) {
                      var item = controller.getData[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.id.toString()),
                          subtitle: Text(item.title.toString()),
                          leading: Text(item.id.toString()),
                        ),
                      );
                    });
          }))
        ],
      ),
    );
  }
}

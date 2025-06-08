import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  const UpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

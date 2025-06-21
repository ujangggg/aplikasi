import 'package:aplikasi/app/modules/create/controllers/create_controller.dart'; // ✅ Tambahkan ini
import 'package:aplikasi/app/modules/create/views/create_view.dart';
import 'package:aplikasi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Muatan',
          style: const TextStyle(
            color: Colors.white, // 🎨 Warna teks putih
            fontWeight: FontWeight.bold, // 🅱️ Bold
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RefreshIndicator(
          onRefresh: controller.refreshMuatan,
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.muatanList.length,
              itemBuilder: (context, index) {
                final data = controller.muatanList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Nama Sopir: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: data.namaSopir,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                text: 'Muatan: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: data.jumlahMuatan.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                text: 'Tanggal: ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: DateFormat(
                                      'yyyy-MM-dd',
                                    ).format(data.tanggal),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),
                        IconButton(
                          onPressed:
                              () => Get.toNamed(Routes.EDIT, arguments: data),
                          icon: const Icon(Icons.edit, color: Colors.blue),
                        ),
                        IconButton(
                          onPressed: () => controller.deleteMuatan(data.id!),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.put(CreateController());
          Get.to(() => const CreateView());

          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Floating Action Button Pressed')),
          // );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

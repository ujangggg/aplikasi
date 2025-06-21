import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambahkan Muatan',
          style: const TextStyle(
            color: Colors.white, // 🎨 Warna teks putih
            fontWeight: FontWeight.bold, // 🅱️ Bold
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF00695C),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFFB2DFDB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Nama Sopir",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.sopirC,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan nama sopir',
                  ),
                ),

                const SizedBox(height: 16),

                const Text(
                  "Muatan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.muatanC,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan jumlah muatan',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                const Text(
                  "Tanggal",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.tanggalC,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan tanggal (yyyy-mm-dd)',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 24),

                Obx(() {
                  return ElevatedButton.icon(
                    onPressed:
                        controller.isLoading.value
                            ? null
                            : () {
                              final nama = controller.sopirC.text;
                              final muatanText = controller.muatanC.text;
                              final tanggalText = controller.tanggalC.text;

                              if (nama.isEmpty ||
                                  muatanText.isEmpty ||
                                  tanggalText.isEmpty) {
                                Get.snackbar(
                                  'Error',
                                  'Semua field harus diisi',
                                );
                                return;
                              }

                              try {
                                final muatan = int.parse(muatanText);
                                final tanggal = DateTime.parse(tanggalText);

                                controller.addMuatan(
                                  namaSopir: nama,
                                  jumlahMuatan: muatan,
                                  tanggal: tanggal,
                                );
                              } catch (e) {
                                Get.snackbar('Error', 'Input tidak valid: $e');
                              }
                            },
                    icon:
                        controller.isLoading.value
                            ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                            : const Icon(Icons.save, color: Colors.white),
                    label: Text(
                      controller.isLoading.value ? 'Menyimpan...' : 'Simpan',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // 🔤 Bold
                        color: Colors.white, // 🔤 Putih
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00695C),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

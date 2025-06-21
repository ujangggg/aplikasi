import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Controller untuk input teks
  final TextEditingController sopirC = TextEditingController();
  final TextEditingController muatanC = TextEditingController();
  final TextEditingController tanggalC = TextEditingController();

  // Observable: Untuk state loading tombol
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    tanggalC.text = DateTime.now().toIso8601String().split('T').first;
  }

  @override
  void onClose() {
    sopirC.dispose();
    muatanC.dispose();
    tanggalC.dispose();
    super.onClose();
  }

  Future<void> addMuatan({
    required String namaSopir,
    required int jumlahMuatan,
    required DateTime tanggal,
  }) async {
    isLoading.value = true;

    try {
      await _firestore.collection('muatan').add({
        'namaSopir': namaSopir,
        'jumlahMuatan': jumlahMuatan,
        'tanggal': Timestamp.fromDate(tanggal), // aman untuk Firestore
      });

      clearForm();

      Get.snackbar(
        'Sukses',
        'Data berhasil ditambahkan',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      // Delay supaya snackbar sempat terlihat
      await Future.delayed(const Duration(milliseconds: 600));

      Get.offAllNamed('/home'); // kembali ke halaman Home
    } catch (e) {
      Get.snackbar('Error', 'Gagal menambahkan data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void clearForm() {
    sopirC.clear();
    muatanC.clear();
    tanggalC.text = DateTime.now().toIso8601String().split('T').first;
  }
}

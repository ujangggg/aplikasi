import 'package:aplikasi/app/data/muatan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable list agar UI update otomatis
  final RxList<MuatanModel> muatanList = <MuatanModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    refreshMuatan();
  }

  /// Ambil semua data dari koleksi 'muatan'
  Future<void> refreshMuatan() async {
    try {
      final snapshot = await _firestore.collection('muatan').get();
      final dataList =
          snapshot.docs
              .map((doc) => MuatanModel.fromMap(doc.data(), doc.id))
              .toList();
      muatanList.assignAll(dataList); // Lebih efisien
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data: $e');
    }
  }

  /// Hapus dokumen berdasarkan ID
  Future<void> deleteMuatan(String id) async {
    try {
      await _firestore.collection('muatan').doc(id).delete();
      muatanList.removeWhere((item) => item.id == id);
      Get.snackbar('Sukses', 'Data berhasil dihapus');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus data: $e');
    }
  }
}

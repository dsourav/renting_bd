import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as Path;

@Injectable()
class CloudStorageService {
  final FirebaseStorage firebaseStorage;

  CloudStorageService(this.firebaseStorage);

  Future<String?> uploadFile({
    required File fileToUpload,
    required String path,
  }) async {
    try {
      var fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final firebaseStorageRef = firebaseStorage.ref().child('$path$fileName');
      var uploadTask = firebaseStorageRef.putFile(fileToUpload);

      var storageSnapshot = await uploadTask.whenComplete(() => null);
      var downloadUrl = await storageSnapshot.ref.getDownloadURL();

      if (uploadTask.snapshot.state == TaskState.success) {
        return downloadUrl.toString();
      }
    } catch (_) {}

    return null;
  }

  Future<void> deleteFile(String fileUrl) async {
    try {
      var url = Uri.decodeFull(Path.basename(fileUrl)).replaceAll(RegExp(r'(\?alt).*'), '');
      final firebaseStorageRef = firebaseStorage.ref().child(url);
      await firebaseStorageRef.delete();
    } catch (_) {}
  }
}

@module
abstract class FirebaseStorageModule {
  @lazySingleton
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
}

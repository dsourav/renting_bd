import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';

@Injectable()
class ImagePickerService {
  final ImagePicker imagePicker;

  ImagePickerService(this.imagePicker);
  Future<XFile?> pickImage() async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      return pickedFile;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

@module
abstract class ImagePickerModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
}

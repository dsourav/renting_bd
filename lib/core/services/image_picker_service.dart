import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renting_bd/core/utils/failure.dart';

@Injectable()
class ImagePickerService {
  final ImagePicker imagePicker;

  ImagePickerService(this.imagePicker);
  Future<Either<Failure, XFile?>> pickImage() async {
    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      return Right(pickedFile);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

@module
abstract class ImagePickerModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();
}

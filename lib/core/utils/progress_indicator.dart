import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class ProgressIndicator {
  Future<void> show({String? status}) => EasyLoading.show(status: status ?? "Please Wait");
  Future<void> showError(String error) => EasyLoading.showError(error);
  Future<void> dismiss() => EasyLoading.dismiss();
}

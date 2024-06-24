import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProgressIndicator {
  Future<void> show({String? status}) => EasyLoading.show(status: status ?? "Please Wait");
  Future<void> showError({String? error}) => EasyLoading.showError(error ?? "Unknown error occurred");
  Future<void> dismiss() => EasyLoading.dismiss();
}

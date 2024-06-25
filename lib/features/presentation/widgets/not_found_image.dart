import 'package:flutter/widgets.dart';
import 'package:renting_bd/core/utils/constant.dart';
import 'package:renting_bd/core/utils/ui_helper.dart';

class NotFoundImage extends StatelessWidget {
  const NotFoundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UiHelper.height(context) * 0.4,
      width: UiHelper.width(context) * 0.4,
      child: Image.asset(Constant.noResultsIcon),
    );
  }
}

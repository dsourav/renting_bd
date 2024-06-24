import 'package:flutter/widgets.dart';
import 'package:renting_bd/core/utils/constant.dart';

class NotFoundImage extends StatelessWidget {
  const NotFoundImage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.4,
      width: size.height * 0.4,
      child: Image.asset(Constant.noResultsIcon),
    );
  }
}

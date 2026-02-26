import 'package:flutter/cupertino.dart';

import '../../../apps/utils/asset.dart';

class HomeWeatherIcon extends StatelessWidget {
  HomeWeatherIcon({super.key,required this.nameIcon});
  String nameIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Container(
      width: size.width / 1.5,
      padding: EdgeInsets.all(20.0),
      child: Image.asset(
        Asset.getLinkImg(nameIcon),
        fit: BoxFit.cover,
      ),
    );
  }
}

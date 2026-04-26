import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';

AppBar buildAppbar({required String title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        'images/arrow_back.svg',
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: AppStyles.style25,
    ),
  );
}
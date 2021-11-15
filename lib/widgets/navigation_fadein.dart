import 'package:flutter/material.dart';

Route navigationFadeIn(BuildContext context, Widget page, int milliseconds) {
  if (milliseconds==null) {
    milliseconds=800;
  }
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: milliseconds),
    pageBuilder: (_, animation, __) => FadeTransition(
      opacity: animation,
      child: page,
    ),
  );
}
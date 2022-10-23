import 'package:flutter/material.dart';

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getContainerHeight(BuildContext context) {
  final mq = MediaQuery.of(context);
  return mq.size.height - AppBar().preferredSize.height - mq.padding.vertical;
}

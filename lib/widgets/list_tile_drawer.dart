import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    super.key,
    required this.title,
    this.iconData,
    this.ontap,
  });
  final String title;
  final IconData? iconData;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(title), leading: Icon(iconData), onTap: ontap);
  }
}

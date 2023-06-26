import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title, subtitle, days;
  final Function() onLongPress;

  const CustomListTile(
      {
        super.key,
        required this.title,
        required this.subtitle,
        required this.days,
        required this.onLongPress
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onLongPress: onLongPress,
        title: Text(title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(subtitle,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text('Required\n$days day(s)'),
      ),
    );
  }
}

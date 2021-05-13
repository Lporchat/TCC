import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateDrawerItem extends StatefulWidget {
  @override
  _CreateDrawerItemState createState() => _CreateDrawerItemState();
  final FaIcon faIcon;
  final String text;
  final GestureTapCallback onTap;
  CreateDrawerItem({this.faIcon, this.text, this.onTap});
}

class _CreateDrawerItemState extends State<CreateDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          widget.faIcon,
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              widget.text,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      onTap: widget.onTap,
    );
  }
}

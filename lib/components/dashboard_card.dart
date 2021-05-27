import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key key,
    this.faIcon,
    this.color,
    this.registro,
    @required this.title,
    this.data,
  }) : super(key: key);

  final IconData faIcon;
  final Color color;
  final String title;
  final int data;
  final String registro;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            child: Center(
              child: faIcon == null
                  ? Container()
                  : FaIcon(
                      faIcon,
                      color: Colors.white,
                      size: 45,
                    ),
            ),
            decoration: BoxDecoration(
              color: color == null ? Theme.of(context).primaryColor : color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
            ),
          ),
          Container(
            height: 90,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808080),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    data == null ? "Sem registros" : "$data",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff5f5f5f),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

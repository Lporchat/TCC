import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key key,
    this.image = noImage,
    this.color,
    this.title,
    this.volume = 0,
    this.data = "0",
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final int volume;
  final AssetImage image;
  final Color color;
  final String title;
  final String data;
  final Function onTap;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    // Projeto projeto = Projeto(
    //   titulo: "Ed da Lagoa",
    //   num_pavimentos: 4,
    //   volume_total: 0,
    // );
    // projeto.store();
    // projeto.count();
    // Size size = MediaQuery.of(context).size;
    return Center(
      child: Card(
        elevation: 1,
        // margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: InkWell(
          onTap: onTap == null ? () {} : onTap,
          onLongPress: onLongPress == null ? () {} : onLongPress,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  color: color == null
                      ? Theme.of(context).accentColor.withOpacity(0.5)
                      : color,
                ),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 35),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(),
                    ),
                  ),
                  child: AutoSizeText(
                    title,
                    maxFontSize: 25,
                    minFontSize: 16,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: image,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (volume == null)
                          ? Text('Volume Total (m³):0')
                          : Text('Volume Total (m³):' '$volume'),
                      SizedBox(
                        height: 5,
                      ),
                      // Text("Detalhes do Projeto"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

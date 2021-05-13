import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';

class FloorCard extends StatelessWidget {
  const FloorCard({
    Key key,
    this.image = noImage,
    this.color,
    this.title,
    this.data = "0",
    this.onTap,
  }) : super(key: key);

  final AssetImage image;
  final Color color;
  final String title;
  final String data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Center(
      child: Card(
        elevation: 1,
        // margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        child: InkWell(
          onTap: onTap == null ? () {} : onTap,
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
                    "Pavimento: (número)",
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
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: image,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Volume (m³): ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(data)
                        ],
                      ),
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

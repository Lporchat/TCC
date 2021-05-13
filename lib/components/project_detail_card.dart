import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProjectDetailCard extends StatelessWidget {
  const ProjectDetailCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Center(
              child: Image(
                fit: BoxFit.contain,
                image: noImage,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text.rich(
                      TextSpan(
                        text: "Volume (m³): ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: "0.0",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: AutoSizeText.rich(
                      TextSpan(
                        text: "Observações: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "Blá blá blá, testando, detalhes, observações, dalnh, aownao ajnfa janwb ktial enw nte b en",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

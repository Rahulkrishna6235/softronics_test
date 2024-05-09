import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../fonts/font.dart';

class DetailsSecond extends StatefulWidget {
  final String name;
  final String Country;
  final String alpha;
  final String domains;
  final String website;


  const DetailsSecond({required this.name,required this.Country,required this.alpha,required this.domains,required this.website,});

  @override
  State<DetailsSecond> createState() => _DetailsSecondState();
}

class _DetailsSecondState extends State<DetailsSecond> {
  Future<void> _launchURL() async {
    String url = widget.website;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4)

        ),
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Center(child: Text(widget.name,style: getFonts(30, Colors.black),)),
              SizedBox(height: 30,),
              Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.place,size: 22,),
                  Text(widget.Country,style: TextStyle(fontSize: 20),),
                ],
              )),
              SizedBox(height: 10,),
              Center(child: Text(widget.alpha,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  width: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.grey,
                          //Colors.grey.withOpacity(0.10),
                          Colors.white
                        ]
                      ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: Offset(0, 1),

                      )
                    ],
                    borderRadius: BorderRadius.circular(6),
                    border: Border(

                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.domains,style: normalFonts(20, Colors.grey.shade400),),
                        SizedBox(height: 20,),
                        Text("More Details",style: normalFonts(18, Colors.black)),
                        SizedBox(height: 3,),

                        InkWell(onTap: _launchURL,
                          child: Row(

                            children: [
                              Text("Website   :  ",style: normalFonts(18, Colors.black)),
                              Text(widget.website,style: TextStyle(decoration: TextDecoration.underline,fontSize: 17,color: Colors.grey),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
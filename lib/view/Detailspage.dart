import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepOrangeAccent,
              Colors.yellow,
              Colors.yellowAccent
            ]
          )
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Center(child: Text(widget.name,style: TextStyle(fontSize: 35),)),
              SizedBox(height: 30,),
              Center(child: Text(widget.Country,style: TextStyle(fontSize: 20),)),
              SizedBox(height: 10,),
              Center(child: Text(widget.alpha,style: TextStyle(fontSize: 25),)),
              SizedBox(height: 20,),
              Text(widget.domains,style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),
              InkWell(onTap: _launchURL,
                child: Text(widget.website,style: TextStyle(decoration: TextDecoration.underline,fontSize: 20),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
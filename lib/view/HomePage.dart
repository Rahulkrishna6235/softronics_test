import 'package:flutter/material.dart';
import 'package:softronics_test/fonts/font.dart';
import 'package:softronics_test/repository/repo_unuversity.dart';
import 'package:softronics_test/view/Detailspage.dart';

import '../Modal/universitymodal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UniversityModal>? uniproducts;

  final UniversityRepo products = UniversityRepo();

  getdata()async{
    products.GetProducts().then((value){
      setState(() {
        uniproducts=value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.8),
         toolbarHeight: 90,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
         // flexibleSpace: Container(
         //   decoration: BoxDecoration(
         //       gradient: LinearGradient(
         //           begin: Alignment.topCenter,
         //           end: Alignment.bottomCenter,
         //           colors: [
         //             Colors.deepOrangeAccent,
         //             Colors.yellow,
         //             Colors.yellowAccent
         //           ]
         //       )
         //   ),
         // ),
        title: Center(child: Text('College List',style: getFonts(22, Colors.black)),),
      ),
      body: uniproducts == null
          ? Center(child: CircularProgressIndicator())
          : Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Colors.deepOrangeAccent,
            //       Colors.yellow,
            //       Colors.yellowAccent
            //     ]
            // )
        ),
            child: ListView.builder(
                    itemCount: uniproducts!.length,
                    itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3)
                        )
                      ],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsSecond(
                          name: "${uniproducts![index].name}",
                          alpha: "${uniproducts![index].alphaTwoCode}",
                          website: "${uniproducts![index].webPages.join()}",
                          domains: "${uniproducts![index].domains.join()}",
                          Country: "${uniproducts![index].country}",
                        )));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(uniproducts![index].name,style: getFonts(20, Colors.black),),
                          trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,size: 20,),
                          // You can display more information here if needed
                        ),

                        elevation: 40,
                        shadowColor: Colors.black12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,)
                ],
              ),
            );
                    },
                  ),
          ),
    );
  }
}
import 'package:flutter/material.dart';
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
         flexibleSpace: Container(
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
         ),
        title: Text('Colleges'),
      ),
      body: uniproducts == null
          ? Center(child: CircularProgressIndicator())
          : Container(
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
            child: ListView.builder(
                    itemCount: uniproducts!.length,
                    itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  InkWell(
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
                        title: Text(uniproducts![index].name),
                        // You can display more information here if needed
                      ),
                      elevation: 5,
                      shadowColor: Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),

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
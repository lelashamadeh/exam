
import 'package:examflutterui/model/fruit_salad_model.dart';
import 'package:examflutterui/service/fruit_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<FruitSaladModel>fruit;
  List <FruitSaladModel>fruits=[];

 
  @override
  Widget build(BuildContext context) {
    
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},
         icon: Icon(Icons.list),
         ),

      ),
      body: FutureBuilder<List<FruitSaladModel>>(
        future:FruitService().getmeal(),
         builder: (context ,snapshot) {
          if (snapshot.connectionState ==ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          
         final user =snapshot.data!;

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Hello Tony,What fruit salad \ncombo do yo want today?",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff27214D),
              
            ),),
            Padding(
              padding: EdgeInsets.all(
                 height*(16/812)),
              child: Text("Recommended Combo",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff27214D),

              ),),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(height*(10/812)),
                child: GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                 itemBuilder: (context ,index){
                  return Container(
                    height: height*(183/812),
                    width: (152/375),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffffffff),
                      
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: width *(40/152),
                          height: height*(40/183),
                          decoration: BoxDecoration(shape: BoxShape.circle,
                          color: Colors.grey),
                          //child: Im
                        ),
                        Text(snapshot.data![index].toString(),
                        style:TextStyle(
                          fontSize: 20,
                          color: Color(0xff27214D)
                        ) ,)
                      ],
                    ),
                    
                  );
                 }),
              ))
          

          ],
        ),
         
      );
         }
      ), 
    );
  }
}

import 'package:flutter/material.dart';

import 'Style.dart';

class ToDoPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
  return ToDoPageView();

  }
}

class ToDoPageView  extends State<ToDoPage>{

  List ToDOList= [];

 String item="";

  MyInputOnChange (content){
    setState(() {
      item= content;
    });
  }

  AddItem(){
    setState(() {
      ToDOList.add({"item":item});
    });
  }




  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('TO Do'),),
    body: Container(
       padding: EdgeInsets.all(10),
      child: Column(
        children: [
            Expanded(
              flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                        child: TextFormField(onChanged: (content){MyInputOnChange(content);}   ,decoration: AppInputDecoration("List Item"),)),
                    Expanded(flex: 20, child: Padding(padding: EdgeInsets.only(left: 5),
                    child:  ElevatedButton(onPressed: (){AddItem();},child: Text("Add"),style: AppButtonStyle(),),
                    )
                    )
                  ],
                )
            ),
            Expanded(
              flex: 90,
                child: ListView.builder(
                  itemCount: ToDOList.length,
                    itemBuilder: (context,index){
                    return Card(
                      child: SizeBox50(
                        Row(
                          children: [
                            Expanded(flex: 80, child: Text(ToDOList[index]['item'].toString())),
                            Expanded(flex: 20, child: TextButton(onPressed: (){},child: Icon(Icons.delete),))
                          ],
                        )
                      )
                    );
                    }
                )
            )
        ],
      ),
    ),

   );
  }

}

import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Covid Risk Calculator',
    home: Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(title: Text('Covid Risk Calculator'),centerTitle: true,),
      body: MyBody(),
    ),
  ));
}
class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  TextEditingController temp = TextEditingController();
  TextEditingController oxygen = TextEditingController();
  TextEditingController hr = TextEditingController();

  String result = " ";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlue,
        height: 700,
        width: 600,
        child: Card(
          
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Center(
                  child: Column(
                    children: [
                      Text('Please fill-up the Form',
                        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),),
                      TextField(controller: temp, decoration: InputDecoration(label: Text("Please! Enter Body Temperature",style: TextStyle(color: Colors.blue),)),),
                      TextField(controller: oxygen, decoration: InputDecoration(label: Text("Please! Enter Oxygen Level",style: TextStyle(color: Colors.blue),)),),
                      TextField(controller: hr, decoration: InputDecoration(label: Text("Please! Enter Heart Rate",style: TextStyle(color: Colors.blue),)),),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                            onPressed: (){
                              double tem = double.parse(temp.text.toString());
                              double oxy = double.parse(oxygen.text.toString());
                              double hrr = double.parse(hr.text.toString());

                              if (tem > 101){
                                if(oxy <90 && hrr < 70){
                                  setState(() {
                                    result = "Consult Hospital";
                                  });
                                }else{
                                  setState(() {
                                    result = "Please make covid Test";
                                  });
                                }
                              }else{
                                setState(() {
                                  result = "Stay home stay safe";
                                });
                              }
                            }, child: Padding(
                          padding: const EdgeInsets.all(9.0),
                            child: Text('Calculate',style: TextStyle(fontSize: 25),)),
                        ),
                      ),


                      Card(
                        color: Colors.black26,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Form(
                            child: SizedBox(height: 220,
                                child: Center(
                                  child: Text(result,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Colors.lightBlueAccent,fontStyle: FontStyle.normal),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Text('Stay Safe       Stay Helathy',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                      ),
                    ],
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}







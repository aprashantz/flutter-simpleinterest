import 'package:flutter/material.dart';

TextStyle myText = TextStyle(fontSize: 20);
TextStyle myText2 = TextStyle(fontSize: 15);
const myColor = Colors.blue;
void main() => runApp(MaterialApp(
      title: "PTR Calculator",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String principle = "", rate = "", time = "", interest = "";

  final p_field = TextEditingController();
  final r_field = TextEditingController();
  final t_field = TextEditingController();

  //var interest = (principle * time * rate) / 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PTR Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              height: 45,
            ),
            //for principle textfield
            TextField(
              keyboardType: TextInputType.number,
              controller: p_field,
              onChanged: (val) {
                setState(() {
                  principle = val;
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Principle",
              ),
              style: myText,
            ),
            SizedBox(
              height: 20,
            ),

            //for time
            TextField(
              keyboardType: TextInputType.number,
              controller: t_field,
              onChanged: (val) {
                setState(() {
                  time = val;
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Time",
              ),
              style: myText,
            ),
            SizedBox(
              height: 20,
            ),

            //for rate
            TextField(
              keyboardType: TextInputType.number,
              controller: r_field,
              onChanged: (val) {
                setState(() {
                  rate = val;
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Rate",
              ),
              style: myText,
            ),
            SizedBox(
              height: 20,
            ),

            //for button
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.blue),
              ),
              height: 50,
              color: myColor,
              child: Text(
                "Calculate Interest",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  interest = (double.parse(principle) *
                          double.parse(time) *
                          double.parse(rate) /
                          100)
                      .toString();
                  p_field.clear();
                  t_field.clear();
                  r_field.clear();
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              "Principle: $principle",
              style: myText2,
            )),

            Center(
                child: Text(
              "Time: $time",
              style: myText2,
            )),
            Center(
                child: Text(
              "Rate: $rate",
              style: myText2,
            )),
            Center(
              child: Text(
                'Simple Interest: $interest',
                style: myText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

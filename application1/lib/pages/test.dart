import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  String greetings = '';

  void initState() {
    super.initState();
  }


  TextEditingController _xcontroller = TextEditingController();
  TextEditingController _ycontroller = TextEditingController();
  @override
  void dispose() {
    _xcontroller.dispose();
    _ycontroller.dispose();
    super.dispose();
  }
  String xvalue = '';
  String yvalue = '';
  String final_response = '';
  final _formkey = GlobalKey<FormState>();
  Future<void> _savingData() async{
    final validation = _formkey.currentState?.validate();
    if (validation!){
      return;
    }
    _formkey.currentState?.save();
  }

  Widget buildx() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'value of x',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _xcontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'enter value',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
            onSaved: (value){
              _xcontroller.text = value!;
            },
          ),
        )
      ],
    );
  }
  Widget buildly() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'value of y',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _ycontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Color(0xff145DA0),
                ),
                hintText: 'enter value',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }
  Widget buildreciveBtn(context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
  //
  //validating the form and saving it


          String url = 'http://10.0.2.2:5000/xvalue';
          final response = await http.get(Uri.parse(url));

          //converting the fetched data from json to key value pair that can be displayed on the screen
          final decoded = json.decode(response.body) as Map<String, dynamic>;
          setState(() {
            final_response = decoded['xvalue'];
          });
          print(final_response);

        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 65, vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
        ),
        child: Text(
          'recive',
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildsendBtn(context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          //
          //validating the form and saving it


          //validating the form and saving it
          _savingData();

          //url to send the post request to
          final url = 'http://10.0.2.2:5000/xvalue';

          //sending a post request to the url
          final response = await http.post(Uri.parse(url), body: json.encode({'name' : xvalue}));
          print("done");
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 70, vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
        ),
        child: Text(
          'send',
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x668AB6F9),
                          Color(0x99C13979),
                          Color(0xcc5C2C90),
                          Color(0xff2A2E74),
                        ])),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding:
                    EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 35,
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/7.png',height: 240,width: 240,),
                        SizedBox(height: 10),
                        Text(
                          'Test page',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        buildx(),
                        SizedBox(height: 10),
                        buildly(),
                        SizedBox(height: 20),
                        buildreciveBtn(context),
                        SizedBox(height: 10),
                        buildsendBtn(context)
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

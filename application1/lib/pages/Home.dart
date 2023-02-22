import 'dart:convert';
import 'package:application1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _customercontroller = TextEditingController();

  var slectedItemOpen;
  var slectedItemHoliday;
  var slectedItemPromo;

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    _customercontroller.dispose();
    super.dispose();
  }


  Widget buildx() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Customers',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 15, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            // controller: _customercontroller,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.numbers,
                color: Color(0xff145DA0),),
              hintText: 'Enter Number of Customers',
              hintStyle: TextStyle(
                color: Colors.black38,
              )),
          ),
        )
      ],
    );
  }

  Widget buildopen(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Open',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius:15, offset: Offset(0, 2))
              ]),
          height: 60,
        child: DropdownButton(
          items: [" YES"," NO"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),onChanged: (val){
         setState(() {
           slectedItemOpen = val ;
         });
        },value:slectedItemOpen ,
        icon: Icon(
            Icons.arrow_drop_down_circle,
            color: Color(0xff145DA0),size: 25,),),

        ),
      ],
    );
  }
  Widget buildholiday(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Holiday',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius:15, offset: Offset(0, 2))
              ]),
          height: 60,
          child: DropdownButton(
            items: [" YES"," NO"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),onChanged: (val){
            setState(() {
              slectedItemHoliday = val ;
            });
          },value:slectedItemHoliday ,
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: Color(0xff145DA0),size: 25,),),

        ),
      ],
    );
  }
  Widget buildpromo(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Promo',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius:15, offset: Offset(0, 2))
              ]),
          height: 60,
          child: DropdownButton(
            items: [" YES"," NO"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),onChanged: (val){
            setState(() {
              slectedItemPromo = val ;
            });
          },value:slectedItemPromo ,
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: Color(0xff145DA0),size: 25,),),

        ),
      ],
    );
  }

  Widget builddoneBtn(context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
        ),
        child: Text(
          'Show Result',
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildLogoutBtn(context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Login();
          }));
        },
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child:Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Color(0xcc89cff0),
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
          child: Row(),
        ),
      ),


      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //       Color(0x668AB6F9),
                //       Color(0x99C13979),
                //       Color(0xcc5C2C90),
                //       Color(0xff2A2E74),
                //     ])),

                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 25,
                  ),

                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/7.png',
                        height: 180,
                        width: 180,
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      buildx(),
                      SizedBox(height: 10),
                      buildopen(context),
                      SizedBox(height: 10),
                      buildholiday(context),
                      SizedBox(height: 10),
                      buildpromo(context),
                      SizedBox(height: 10),
                      builddoneBtn(context),
                      SizedBox(height: 50),
                      buildLogoutBtn(context),
                    ],
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

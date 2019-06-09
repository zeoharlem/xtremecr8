import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddUserPage extends StatefulWidget {

  static const String IMAGEFILE = "imagePix";
  static const String SIGNBOSS  = "bossSign";
  static const String USERSIGN  = "userSign";

  @override
  State<StatefulWidget> createState() {
    return _AddUserPageState();
  }
}

class _AddUserPageState extends State<AddUserPage> {
  String firstname, lastname, email;
  String designation, code, backDesc, companyTitle;
  File userSignature, authorizedSignature;
  String additionalNotes;
  File _imageFile, _signBoss, _userSign;


  final GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

  TextStyle buttonStyle = TextStyle(
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
      fontSize: 14.0,
      color: Colors.white);

  @override
  Widget build(BuildContext context) {

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => {},
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Text(
          "Submit",
          textAlign: TextAlign.center,
          style: buttonStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    void _submitFormWidgetRow(){
      _formGlobalKey.currentState.save();
    }

    //Get Image from the Camera or Gallery
    void _getImage(BuildContext context, ImageSource source, String typeImage){
      ImagePicker.pickImage(source: source, maxHeight: 400.0).then((File image){
        setState(() {
          switch(typeImage){
            case AddUserPage.SIGNBOSS:
              _signBoss = image;
              break;
            case AddUserPage.USERSIGN:
              _userSign = image;
              break;
            case AddUserPage.IMAGEFILE:
            _imageFile  = image;
              break;
          }
        });

      });
    }

    //Open Modal Box Window
    void _openImageBoxPicker(BuildContext context, String param){
      showModalBottomSheet(context: context, builder: (BuildContext context){
        return Container(
          height: 150.0,
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text("Choose Picture Action{{$param}}", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Ubuntu", fontSize: 20.0),),
              SizedBox(height: 10.0,),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(onPressed: (){
                    _getImage(context, ImageSource.gallery, param);
                  }, icon: Icon(Icons.image, color: Colors.grey,), label: Text("Gallery", style: TextStyle(
                      fontSize: 13.0, color: Colors.grey, fontFamily: "Ubuntu", fontWeight: FontWeight.bold),)),
                  FlatButton.icon(onPressed: (){
                    _getImage(context, ImageSource.camera, param);
                  }, icon: Icon(Icons.camera, color: Colors.grey,), label: Text("Camera", style: TextStyle(
          fontSize: 13.0, color: Colors.grey, fontFamily: "Ubuntu", fontWeight: FontWeight.bold),)),
                ],
              )
            ],
        ),);
      });
    }

    return Container(
      //padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formGlobalKey,
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Text("Create Design", style: TextStyle(color: Colors.white30, fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")),
            SizedBox(height: 20.0,),
            TextFormField(
              onSaved: (String value){

              },
              style: TextStyle(color: Colors.white, fontSize: 13.0, fontFamily: "SourceSansPro"),
              decoration: InputDecoration(
                labelText: "First Name",
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Ubuntu"),
              ),
              //keyboardType: TextInputType.text,
            ),
            TextFormField(
              onSaved: (String value){

              },
              style: TextStyle(color: Colors.white, fontSize: 13.0, fontFamily: "SourceSansPro"),
              decoration: InputDecoration(
                labelText: "Last Name",
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")
              ),
              //keyboardType: TextInputType.text,
            ),
            TextFormField(
              onSaved: (String value){

              },
              style: TextStyle(color: Colors.white, fontSize: 13.0, fontFamily: "SourceSansPro"),
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              onSaved: (String value){

              },
              style: TextStyle(color: Colors.white, fontSize: 13.0, fontFamily: "SourceSansPro"),
              decoration: InputDecoration(
                  labelText: "Designation",
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")
              ),
              keyboardType: TextInputType.multiline,
            ),
            TextFormField(
              onSaved: (String value){

              },
              style: TextStyle(color: Colors.white, fontSize: 13.0, fontFamily: "SourceSansPro"),
              decoration: InputDecoration(
                  labelText: "Company",
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")
              ),
              //keyboardType: TextInputType.text,
            ),
            TextFormField(
              onSaved: (String value){

              },
              style: TextStyle(color: Colors.white, fontSize: 13.0, fontFamily: "SourceSansPro"),
              decoration: InputDecoration(
                  labelText: "Unique Code",
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")
              ),
              //keyboardType: TextInputType.text,
            ),
            TextFormField(
              onSaved: (String value){

              },
              style: TextStyle(color: Colors.white, fontSize: 13.0, fontFamily: "SourceSansPro"),
              decoration: InputDecoration(
                  labelText: "CardBack Notes",
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")
              ),
              keyboardType: TextInputType.multiline,
            ),
            TextFormField(
              onSaved: (String value){

              },
              style: TextStyle(color: Colors.white, fontSize: 13.0, fontFamily: "SourceSansPro"),
              decoration: InputDecoration(
                  labelText: "Additional Notes",
                  labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: "Ubuntu")
              ),
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 10.0,),
            Row(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: (){
                    _openImageBoxPicker(context, AddUserPage.USERSIGN);
                  },
                  icon: Icon(Icons.add, color: Colors.white30),
                  label: Text("My Sign",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                    fontSize: 13.0
                  )),
                ),
                FlatButton.icon(
                  onPressed: (){
                    _openImageBoxPicker(context, AddUserPage.SIGNBOSS);
                  },
                  icon: Icon(Icons.check, color: Colors.white30),
                  label: Text("Boss Sign",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                      fontSize: 13.0
                  )),
                ),
                FlatButton.icon(
                  onPressed: (){
                    _openImageBoxPicker(context, AddUserPage.IMAGEFILE);
                  },
                  icon: Icon(Icons.add_a_photo, color: Colors.white30),
                  label: Text("My Pix",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                      fontSize: 13.0
                  )),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 50.0,
                  child: _userSign != null ? Image.file(_userSign) : Text(""),
                ),
                Container(
                  height: 50.0,
                  child: _signBoss != null ? Image.file(_signBoss) : Text(""),
                ),
                Container(
                  height: 50.0,
                  child: _imageFile != null ? Image.file(_imageFile) : Text(""),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            loginButton
          ],
        )
      )
    );
  }
}

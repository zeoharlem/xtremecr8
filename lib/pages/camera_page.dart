import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xtremecr8/contents/backgrounds.dart';
import 'package:xtremecr8/contents/download.dart';
import 'package:xtremecr8/contents/opacitys.dart';
import 'package:xtremecr8/contents/shapes.dart';
import 'package:xtremecr8/contents/texts.dart';
import 'package:xtremecr8/ui/tab_bar_animation.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CameraPage extends StatefulWidget {

  CameraPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CameraPageState();

}

class _CameraPageState extends State<CameraPage>{

  File _imageFile;
  List<Widget> _widgetsRow;

  void _getImage(BuildContext context, ImageSource source){
    ImagePicker.pickImage(source: source, maxHeight: 400.0).then((File image){
      setState(() {
        _imageFile  = image;
      });

      //Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    //Show Modal onClick of buttons of ToolBox
    void _openImageBoxPicker(BuildContext context, String param, Widget typePageWidget){
      showModalBottomSheet(context: context, builder: (BuildContext context){
        return Container(
          height: 200.0,
          child: typePageWidget,
        );
      });
    }

    var _alertStyle = AlertStyle(
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontFamily: "SourceSansPro", fontSize: 14.0),
      titleStyle: TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.bold, fontSize: 20.0)
    );

    return Container(
      //padding: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white10
              )
            ),
            child: Container(
              key: ValueKey("keyBgRowState"),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.white30
                  )
              ),
              child: Stack(
                children: <Widget>[

                ],
              ),
            )
          ),
          //set up the toolbox buttons
          Container(
            //width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: Colors.white,
            ),
            margin: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.camera_alt, size: 18.0,),
                      onPressed: (){
                        _getImage(context, ImageSource.camera);
                      }, label: Text(""),
                    )
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.add_a_photo, size: 18.0),
                      onPressed: (){
                        _getImage(context, ImageSource.gallery);
                      }, label: Text(""),
                    )
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.text_fields, size: 18.0),
                      onPressed: (){
                        _openImageBoxPicker(context, "texts", TextsPage());
                      }, label: Text(""),
                    )
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.format_shapes, size: 18.0),
                      onPressed: (){
                        _openImageBoxPicker(context, "shapes", ShapesPage());
                      }, label: Text(""),
                    )
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.perm_media, size: 18.0),
                      onPressed: (){
                        _openImageBoxPicker(context, "backgrounds", BackgroundsPage());
                      }, label: Text(""),
                    )
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.pages, size: 18.0),
                      onPressed: (){
                        _openImageBoxPicker(context, "opacity", OpacitysPage());
                      }, label: Text(""),
                    )
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.file_download, size: 18.0),
                      onPressed: (){
                        _openImageBoxPicker(context, "download", DownloadPage());
                      }, label: Text(""),
                    )
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.radio_button_checked, size: 18.0),
                      onPressed: (){
                        _openImageBoxPicker(context, "radio", Container(

                        ));
                      }, label: Text(""),
                    )
                ),
                SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: FlatButton.icon(
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(Icons.clear, size: 18.0),
                      onPressed: (){
                        //Alert Box Callback Method
                        Alert(
                          style: _alertStyle,
                          context: context,
                          type: AlertType.warning,
                          title: "Are You Sure",
                          desc: "Listen you are about clearing the Design.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Yes",
                                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Ubuntu"),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Colors.blue,
                            ),
                            DialogButton(
                              child: Text(
                                "No",
                                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "Ubuntu"),
                              ),
                              onPressed: () => Navigator.pop(context),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                          ],
                        ).show();
                      }, label: Text(""),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

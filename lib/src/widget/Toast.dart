import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast{

}

void toastWidget(msj){
  Fluttertoast.showToast(
    msg: msj,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
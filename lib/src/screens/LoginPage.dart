import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  LoginPage({Key key}) : super(key : key);

  @override
  _LoginPageState createState() => _LoginPageState();


}
class _LoginPageState extends State<LoginPage>{

  bool _loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.cyan[300], Colors.cyan[800]]
              ),
            ),
            child: Image.asset(
              "assets/images/logo.png",
              color: Colors.white,
              height: 150,
            ),
          ),

          Transform.translate(
            offset: Offset(0, -10) ,
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 260, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Usuario:"
                          ),
                        ),
                        SizedBox(height: 25,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Contraseña:"
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20,),
                        Theme(
                          data: Theme.of(context).copyWith(accentColor: Colors.white),
                          child: RaisedButton(
                            onPressed: () => _login(context),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Iniciar session"),
                                if(_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: CircularProgressIndicator(),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("No estas registrado?"),
                            FlatButton(
                              textColor: Theme.of(context).primaryColor,
                              child: Text("Registrarse"),
                              onPressed: (){
                                Navigator.of(context).pushNamed("/register");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  //**********METODOS******************************


  //LOGIN
  void _login(BuildContext context) {
    if(!_loading){
      setState(() {
        _loading = true;
      });
    }
  }
  
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  //Metodos
  LoginPage( {Key key}) : super(key : key);

  @override
  _LoginPageState createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage>{

  bool _loading = false;
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  String _nameUser;
  String _password;

  String _errorMessage = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _keyForm,
        child: Stack(
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
                            onSaved: (value){
                              _nameUser = value;
                            },
                            validator: (value){
                              if(value.isEmpty){
                                return "Este campo es obligatorio.";
                              }
                            },
                          ),
                          SizedBox(height: 25,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Contraseña:"
                            ),
                            onSaved: (value){
                              _password = value;
                            },
                            validator: (value){
                              if(value.isEmpty){
                                return "Este campo es obligatorio.";
                              }
                            },
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
                          if(_errorMessage.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                _errorMessage,
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
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
      ),
    );
  }

  //**********METODOS******************************

  void _login(BuildContext context)  async{

    if(_keyForm != null && _keyForm.currentState.validate()){
      if(!_loading) {
        setState(() {
          _loading = true;
          _errorMessage =  "";
        });
      }

      if(_nameUser.isNotEmpty && _password.isNotEmpty){
        setState(() {
          _loading = false;
          _errorMessage =  "";
        });
      }else{
        setState(() {
          _errorMessage = "Usuario no existe";
        });
      }



      // User user = await widget.serverController.login(_nameUser, _password);
      // if(user != null){
      //   Navigator.of(context).pushReplacementNamed("/home", arguments: user );
      // }else{
      //   setState(() {
      //     _loading = false;
      //     _errorMessage = "Usuario o contraseña incorrecta.";
      //   });
      // }

    }
  }



  //*********metodo iniciar y parar
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
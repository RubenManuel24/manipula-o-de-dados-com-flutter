
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String _textoSalvo = "Nada Salvo";
  TextEditingController _controller = TextEditingController();

  _salvar() async {

    String valorDigitado = _controller.text;

       //final prefs = await SharedPreferences.getInstance();
       //await prefs.setString( "nome", valorDigitado);

       print("Salvo : ${valorDigitado}");


  }

  _recuperar() async{

    //final prefs = await SharedPreferences.getInstance();
    
    setState(() {
        //  _textoSalvo = prefs.getString("nome") ?? "Sem valor";
        });
  
    print("Texto Salvo: ${_textoSalvo}") ; 
    

  }

  _remover() async {

    // final prefs = await SharedPreferences.getInstance();
    // prefs.remove("nome");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Manipulação de dados",
                ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
           Text(_textoSalvo,
           style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 20 
                   ),
           ),
           
           Padding(padding: EdgeInsets.all(10), 
           child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
            labelText: 'Digita Algo!',
           
            ),
            controller: _controller,
            cursorColor: Colors.black,
           ) 
           ,),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed:() => _salvar(), 
                child: Text("Salvar", style: TextStyle(
                    color: Colors.white
                ),),
                 style: TextButton.styleFrom(backgroundColor: Colors.black),
                ),
                TextButton(
                onPressed:() => _recuperar(), 
                child: Text("Recuperar", style: TextStyle(
                    color: Colors.white
                ),),
                 style: TextButton.styleFrom(backgroundColor: Colors.black),
                ),
                TextButton(
                onPressed: () => _remover(), 
                child: Text("Remover", style: TextStyle(
                    color: Colors.white
                ),),
                 style: TextButton.styleFrom(backgroundColor: Colors.black),
                ),
            ],
           )

          ],
        ),
      ),
    );
  }
}

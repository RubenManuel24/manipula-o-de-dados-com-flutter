import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSaio extends StatefulWidget {
  HomeSaio({Key? key}) : super(key: key);

  @override
  State<HomeSaio> createState() => _HomeSaioState();
}

class _HomeSaioState extends State<HomeSaio> {

  String _texto = "Nada digitado";
  TextEditingController _controller = TextEditingController();

  _salvar2() async {
    String _valorSavo = _controller.text;

    final pref = await SharedPreferences.getInstance();
    pref.setString("texto",_valorSavo);
  }

  _recuperar2() async {

    final pref = await SharedPreferences.getInstance();

    setState(() {
       _texto = pref.getString("texto") ?? "Sem Texto" ;
    });

  }

  _remover2() async {

    final pref = await SharedPreferences.getInstance();
    pref.remove("texto");


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Manipulação de dados")
      ),

      body: Container(
        padding: EdgeInsets.all(10,),
        child: Column(
         children: [
          Text(_texto, style: TextStyle(
            fontSize: 20,
            fontWeight:   FontWeight.bold
          ),),
          Padding(padding: EdgeInsets.all(15), child: 
           TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Digita Algo",
              border: InputBorder.none
            ),
            controller: _controller,
          ),),
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
            onPressed: () => _salvar2(), 
            child: Text("Salvar", style:TextStyle(
              color:  Colors.black
            ) ,),
            style: TextButton.styleFrom(backgroundColor: Colors.red),
          ),
          TextButton(
            onPressed: () => _recuperar2(), 
            child: Text("Recuperar", style:TextStyle(
              color:  Colors.black
            ) ,),
            style: TextButton.styleFrom(backgroundColor: Colors.red),
          ),
          TextButton(
            onPressed: () => _remover2(), 
            child: Text("Remover", style:TextStyle(
              color:  Colors.black
            ) ,),
            style: TextButton.styleFrom(backgroundColor: Colors.red),
          ),
            ],
          ),
         ],
      ),
    )
    );
  }
}
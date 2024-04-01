import 'package:flutter/material.dart';

void main(){
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Тестовое приложение',
      home: TextInputField(),
    );
  }
}

class TextInputField extends StatefulWidget{
  @override
  TextInputFieldState createState(){
    return TextInputFieldState();
  }
}

class TextInputFieldState extends State <TextInputField>{
  TextEditingController textController = TextEditingController();
  String displayText = '';
  bool isInputCorrect = false;

  void updateDisplayTextField (String newText){
    setState((){
      displayText = newText;
    });
  }
  void clearText (){
    setState((){
      textController.clear();
      displayText='';
      isInputCorrect=false;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Просмотр введенного текста',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 14.0
          ),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(30.0),
                child: TextField(
                  controller: textController,
                  onChanged: (text){
                    setState((){
                      isInputCorrect = text.isNotEmpty;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Введите текст',
                    errorText: isInputCorrect ? null: 'Некорректный ввод',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: isInputCorrect ? (){
                    updateDisplayTextField(textController.text);
                  }: null,
                  child: Text(
                    'Показать текст',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  )),
              SizedBox(height:30.0),
              Text('Ваш текст: $displayText',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold
                ),),cl


              SizedBox(height: 18,),
              ElevatedButton(
                  onPressed: clearText,
                  child: Icon(Icons.clear)
              ),
            ],
          )
      ),
    );
  }
}
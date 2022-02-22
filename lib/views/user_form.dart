

import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  const UserForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            icon: Icon(Icons.save)
          ),
        ],
      ),    
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(),
        ),
      ),  
    );
  }
}
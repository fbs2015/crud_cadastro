import 'package:crud_cadastro/models/user.dart';
import 'package:crud_cadastro/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget { 

  @override
  State<UserForm> createState() => _UserFormState();
}
class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  void _loadFormData(User user){
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();

     final user = ModalRoute.of(context)?.settings.arguments != null 
     ? ModalRoute.of(context)?.settings.arguments  as User 
     : User(name: '', email: '', avatarUrl: '');  
    _loadFormData(user);   
  }

  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: [
          IconButton(
            onPressed: (){
              final isValid = _form.currentState?.validate() ?? false;

              if (isValid) {
                _form.currentState?.save();
                Provider.of<UsersProvider>(context, listen: false).put(User(
                  id: _formData['id'].toString(),
                  name: _formData['name'].toString(), 
                  email: _formData['email'].toString(), 
                  avatarUrl: _formData['avatarUrl'].toString()));
                Navigator.of(context).pop();
              }
            }, 
            icon: Icon(Icons.save)
          ),
        ],
      ),    
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(          
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'].toString(),
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Nome inválido';
                  }
                  if(value.trim().length < 3){
                    return 'Nome muito pequeno. Mínimo 3 letras.';
                  }
                },
                onSaved: (value) => _formData['name'] = value.toString(),
              ),
              TextFormField(
                initialValue: _formData['email'].toString(),
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email']  =value.toString(),
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'].toString(),
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value.toString(),
              ),
            ],
          ),
        ),
      ),  
    );
  }
}
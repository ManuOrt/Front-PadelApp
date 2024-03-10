import 'package:flutter/material.dart';
import 'package:front_end_padelapp/models/user_model.dart';
import 'package:front_end_padelapp/providers/users_provider.dart';
import 'package:provider/provider.dart';

class SelectionTrainer extends StatelessWidget {
  final int userId;

  const SelectionTrainer({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<UsersProvider>(context, listen: false).getUserById(userId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error: No se ha podido cargar el usuario'),
            );
          } else {
            UserModel user = Provider.of<UsersProvider>(context).user!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (user.userImg != null)
                    Image.network(
                      user.userImg!,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${user.name!}', style: TextStyle(fontSize: 20, color: Colors.black)),
                        Text('Surname: ${user.surname!}', style: TextStyle(fontSize: 20, color: Colors.black)),
                        Text('Email: ${user.email!}', style: TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
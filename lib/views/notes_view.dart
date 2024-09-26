import 'package:flutter/material.dart';
import 'package:learningdart/constants/routes.dart';
import 'package:learningdart/enums/menu_action.dart';
import 'package:learningdart/services/auth/auth_service.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<MenuAction>(
            itemBuilder: (context){
              return const[
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text('Logout'),
              ),
              ];
            },
            onSelected: (value) async {
              switch (value)  {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout){
                   await AuthService.firebase().logOut();
                   Navigator.of(context).pushNamedAndRemoveUntil(
                       loginRoute,
                           (_) => false
                   );
                  }
              }
            },
          )
        ],
        title: const Text('My Notie'),
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context){
  return showDialog<bool>(
      context: context,
      builder: (context){
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text('Are you sure you want to log out?') ,
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                },
                child: const Text('No')
            ),
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop(true);
                },
                child: const Text('Yes')
            )
          ],
        );
      }
  ).then((value) => value ?? false);
}



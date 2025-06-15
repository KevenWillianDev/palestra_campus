import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:palestra_campus/home/controller.dart';
import 'package:palestra_campus/home/scanner.dart';
import 'package:palestra_campus/models/user.model.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({super.key, required this.title});

  final String title;

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  final HomeController _controller = HomeController();

  void _onDetect(barcodes) {
    if (barcodes.barcodes.isNotEmpty) {
      final barcode = barcodes.barcodes.first;
      try {
        final userData = barcode.rawValue;
        if (userData != null) {
          final userJson = Map<String, dynamic>.from(jsonDecode(userData));
          bool response = _controller.adicionarUsuario(
            UserModel.fromJson(userJson),
          );
          if (response) {
            const snackBar = SnackBar(
              content: Text('Usuário adicionado com sucesso!'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          }
        }
      } catch (e) {
        debugPrint('Error parsing barcode: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, child) {
            if (_controller.userCount == 0) {
              return const Center(child: Text('Nenhum usuário adicionado.'));
            }
            return ListView.builder(
              itemCount: _controller.userCount,
              itemBuilder: (context, index) {
                final user = _controller.users[index];
                return UserTile(
                  user: user,
                  onDismissed: (direction) {
                    _controller.removerUsuario(user);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${user.name} removido com sucesso!'),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MobileScannerSimple(onDetect: _onDetect),
            ),
          );
        },
        tooltip: 'Scan QR Code',
        child: const Icon(Icons.qr_code),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final UserModel user;
  final void Function(DismissDirection) onDismissed;
  const UserTile({super.key, required this.user, required this.onDismissed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(user.id.toString()), // chave única por item
      direction:
          DismissDirection
              .endToStart, // esquerda para a direita: startToEnd | endToStart
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: onDismissed,
      child: ListTile(
        leading: const Icon(Icons.account_circle),
        title: Text(user.name),
        subtitle: Text(user.email),
        onTap: () {},
      ),
    );
  }
}

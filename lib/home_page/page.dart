// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:palestra_campus/home_page/scanner.dart';
import 'package:palestra_campus/user.model.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({super.key, required this.title});

  final String title;

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  String? scannedCode;
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text(user?.name ?? 'No User'),
              subtitle: Text(user?.email ?? 'No Email'),
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => QRViewExample(
                    onScan: (code) {
                      setState(() {
                        scannedCode = code;
                        print(scannedCode);
                      });
                    },
                  ),
            ),
          );
        },
        tooltip: 'Scan QR Code',
        child: const Icon(Icons.qr_code),
      ),
    );
  }
}

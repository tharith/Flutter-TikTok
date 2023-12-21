import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart'
    hide XFile; // hides to test if share_plus exports XFile
import 'package:share_plus/share_plus.dart';

class SharePlus extends StatefulWidget {
  const SharePlus({super.key});

  @override
  State<SharePlus> createState() => _SharePlusState();
}

class _SharePlusState extends State<SharePlus> {
  void _shareContent(String title, String url) async {
    final String sharedText = '$title: $url';

    await Share.share(sharedText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Plus Plugin Demo'),
        elevation: 4,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Image.network(
              'https://picsum.photos/200/300',
              height: 200,
              width: 300,
            ),
            const SizedBox(height: 20),
            Text(
              'Check out this cool image!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ActionChip(
              onPressed: () {
                _shareContent(
                  'Check out this cool image!',
                  'https://picsum.photos/200/300',
                );
              },
              avatar: const Icon(Icons.share),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}

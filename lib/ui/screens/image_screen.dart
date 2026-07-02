import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  final String url;
  const ImageScreen({
    super.key,
    required this.url,
  });

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 12,
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Image.network(widget.url),
          ElevatedButton.icon(
              onPressed: (){},
              label: Text("Download Image"),
            icon: Icon(Icons.download),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ButtonList(),
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  final List<String> buttonTitles = [
    'Instagram',
    'Linkedin',
    'Portifólio',
    'WhatsApp'
  ];

  // Função para abrir URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttonTitles
          .map(
            (title) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String url;
                    switch (title) {
                      case 'Instagram':
                        url =
                            'https://instagram.com/engcomputacao.fastech?igshid=YzAwZjE1ZTI0Zg==';
                        break;
                      case 'Linkedin':
                        url =
                            'https://www.linkedin.com/in/gabriel-aparecido-53604828a/';
                        break;
                      case 'Portifólio':
                        url = 'https://youtu.be/dQw4w9WgXcQ';
                        break;
                      case 'WhatsApp':
                        url = 'https://wa.me/5566996519294';
                        break;
                      default:
                        url = '';
                    }

                    _launchURL(url);
                  },
                  child: Text(title),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

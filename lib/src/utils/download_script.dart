import 'dart:convert';
import 'dart:html';

void downloadFile(String text) {
  final bytes = utf8.encode(text);
  final blob = Blob([bytes]);
  final url = Url.createObjectUrlFromBlob(blob);
  AnchorElement anchorElement = AnchorElement(href: url);

  anchorElement.download = "main.py";
  anchorElement.click();
}

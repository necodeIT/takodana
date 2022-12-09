part of 'parser_service.dart';

extension _Hyphen on ParserService {
  void parseHyphen(SyntaxNode root, DocumentLine line) {
    // Check if it's a bullet
    // it's a bullet if there's
    //  - no text before the star
    //  - a space after the star
    if (line.hasNext() && line.next().isSpace) {
      var pre = line.sublist(0, _pointer);

      var isWhiteSpace = true;

      // Check if there's any text before the star
      for (var i = 0; i < pre.length; i++) {
        if (!pre[i].isSpace) {
          isWhiteSpace = false;
          break;
        }
      }

      if (isWhiteSpace) {
        var bullet = BulletNode(level: pre.length ~/ 2);

        _pointer++;

        root.addChild(_parseLine(line, bullet));
      }

      return;
    }

    // if it's neither of the above, it's just plain text
    root.addChild(PlainTextNode(line[_pointer].value));
  }
}

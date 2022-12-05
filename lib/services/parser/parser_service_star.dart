part of 'parser_service.dart';

extension _Star on ParserService {
  void parseStar(SyntaxNode root) {
    // Check if it's a bullet
    // it's a bullet if there's
    //  - no text before the star
    //  - a space after the star
    if (hasNext() && next().isSpace) {
      var pre = _line.sublist(0, _pointer);

      var isWhiteSpace = true;

      // Check if there's any text before the star
      for (var i = 0; i < pre.length; i++) {
        if (!pre[i].isSpace) {
          isWhiteSpace = false;
          break;
        }
      }

      if (isWhiteSpace) {
        var bullet = BulletNode("", level: pre.length ~/ 2);

        _pointer++;

        root.addChild(_parseLine(_line, bullet));
      }
    }

    // Check if it's bold
    // it's bold if there's
    //  - are two stars before the text
    //  - are two stars after the text
    //  - are whitespaces after the first two stars
    if (hasNext() && next().isStar && _pointer + 2 < _line.length && !_line[_pointer + 2].isSpace) {
      var isBold = true;

      // Check if there's whitespaces after the first two stars
      if (isBold) {
        for (var i = pre.length - 3; i >= 0; i--) {
          if (!pre[i].isSpace) {
            isBold = false;
            break;
          }
        }
      }

      if (isBold) {
        var bold = BoldNode();

        _pointer += 2;

        root.addChild(_parseLine(_line.sublist(_pointer), bold));
      }
    }
  }
}

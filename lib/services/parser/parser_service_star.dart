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
    if (hasNext() && next().isStar && hasNext(2) && !next(2).isSpace) {
      var isBold = true;
      var i = _pointer + 2;

      for (i; i < _line.length; i++) {
        if (_line[i].isStar) {
          if (i + 1 < _line.length && _line[i + 1].isStar) {
            break;
          } else {
            isBold = false;
            break;
          }
        }
      }

      if (isBold) {
        var parent = root.isRoot ? root.addChild(PlainTextNode("")) : root;

        var bold = BoldNode("");

        _pointer += 2;

        parent.addChild(_parseLine(_line.sublist(0, i), bold));
        _pointer = i + 2;

        _parseLine(_line, parent);
      }
    }
  }
}

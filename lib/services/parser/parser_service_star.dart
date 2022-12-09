part of 'parser_service.dart';

extension _Star on ParserService {
  void parseStar(SyntaxNode root, DocumentLine line) {
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

    // Check if it's bold
    // it's bold if there's
    //  - are two stars before the text
    //  - are two stars after the text
    //  - are whitespaces after the first two stars
    if (line.hasNext() && line.next().isStar && line.hasNext(2) && !line.next(2).isSpace) {
      var potentialClosers = <int>[];
      var i = line.length - 1;

      /// loop through the line in reverse
      for (i; i > _pointer + 2; i--) {
        if (line[i].isStar && i - 1 > _pointer + 2 && line[i - 1].isStar) {
          i--;
          potentialClosers.add(i);
        }
      }

      if (potentialClosers.isNotEmpty) {
        i = potentialClosers.last;
        var parent = root.isRoot ? root.addChild(ParagraphNode()) : root;

        var bold = BoldNode();

        _pointer += 2;

        parent.addChild(_parseLine(line.sublist(0, i), bold));
        _pointer = i + 2;

        _parseLine(line, parent);
      }

      return;
    }

    // Check if it's italic
    // it's italic if there's
    //  - one star before the text
    //  - one star after the text
    //  - no spaces after the first star
    if (line.hasNext() && !line.next().isSpace) {
      var potentialClosers = <int>[];
      var i = line.length - 1;

      /// loop through the line in reverse
      for (i; i > _pointer + 1; i--) {
        if (line[i].isStar) {
          potentialClosers.add(i);
        }
      }

      if (potentialClosers.isNotEmpty) {
        i = potentialClosers.last;
        var parent = root.isRoot ? root.addChild(ParagraphNode()) : root;

        var italic = ItalicNode();

        _pointer++;

        parent.addChild(_parseLine(line.sublist(0, i), italic));
        _pointer = i + 1;

        _parseLine(line, parent);
      }

      return;
    }

    // if it's neither of the above, it's just plain text
    root.addChild(PlainTextNode(line[_pointer].value));
  }
}

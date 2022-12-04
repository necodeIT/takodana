part of takodana_engine;

class ParserService extends IParserService {
  @override
  parse(tokens, [root]) {
    root ??= SyntaxNode.root();

    var lines = <List<Token>>[[]];

    var index = 0;

    for (var token in tokens) {
      if (token.isNewLine) {
        lines.add([]);
        index++;
      } else {
        lines[index].add(token);
      }
    }

    for (var line in lines) {
      for (var pointer = 0; pointer < line.length; pointer++) {
        bool hasNext() => pointer + 1 < line.length;
        Token next() => line[pointer + 1];

        var token = line[pointer];

        /// Check for header
        if (token.isHeader && pointer == 0) {
          var level = 1;

          // count the number of #s  (level)
          while (hasNext() && next().isHeader) {
            level++;
            pointer++;
          }

          /// Check if valid header
          if (level <= 6 && hasNext() && next().isSpace) {
            var header = HeaderNode("", level: level);

            pointer++;

            // parse the header text
            root.addChild(parse(line.sublist(pointer), header));
          } else {
            var text = PlainTextNode(token.value * level);

            root.addChild(parse(line.sublist(pointer), text));
          }

          break;
        }

        if (token.isText) {
          root.addChild(PlainTextNode(token.value));
        }

        // Check for stars
        if (token.isStar) {
          var pre = line.sublist(0, pointer);

          // Check if it's a bullet
          // it's a bullet if there's
          //  - no text before the star
          //  - a space after the star
          if (hasNext() && next().isSpace) {
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

              pointer++;

              root.addChild(parse(line.sublist(pointer), bullet));
            }
          }
        }
      }
    }

    return root;
  }
}

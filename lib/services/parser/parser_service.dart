import 'package:takodana_engine/takodana_engine.dart';

part 'parser_service_star.dart';
part 'parser_service_helpers.dart';
part 'parser_service_header.dart';

class ParserService extends IParserService {
  int _pointer = 0;
  List<Token> _line = [];

  @override
  parse(tokens) {
    SyntaxNode root = SyntaxNode.root();

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

    for (_line in lines) {
      _parseLine(_line, root);
    }

    return root;
  }

  _parseLine(Line line, SyntaxNode root) {
    for (_pointer; _pointer < _line.length; _pointer++) {
      var token = _line[_pointer];

      /// Check for header
      if (token.isHeader && _pointer == 0) parseHeader(root);

      if (token.isText) {
        root.addChild(PlainTextNode(token.value));
      }

      // Check for stars
      if (token.isStar) parseStar(root);
    }

    _pointer = 0;
  }
}

typedef Line = List<Token>;

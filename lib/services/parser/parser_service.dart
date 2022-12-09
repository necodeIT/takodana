import 'package:takodana_engine/takodana_engine.dart';

part 'parser_service_star.dart';
part '../../models/document_line.dart';
part 'parser_service_header.dart';

class ParserService extends IParserService {
  int _pointer = 0;

  void _setPointer(int value) {
    _pointer = value;
  }

  int _getPointer() {
    return _pointer;
  }

  @override
  parse(tokens) {
    SyntaxNode root = SyntaxNode.root();

    var lines = <DocumentLine>[DocumentLine([], _getPointer, _setPointer)];

    var index = 0;

    for (var token in tokens) {
      if (token.isNewLine) {
        lines.add(DocumentLine([], _getPointer, _setPointer));
        index++;
      } else {
        lines[index].add(token);
      }
    }

    for (var line in lines) {
      _parseLine(line, root);
      _pointer = 0;
    }

    return root;
  }

  SyntaxNode _parseLine(DocumentLine line, SyntaxNode root) {
    for (_pointer; _pointer < line.length; _pointer++) {
      var token = line[_pointer];

      /// Check for header
      if (token.isHeader && _pointer == 0) parseHeader(root, line);

      if (token.isText) {
        root.addChild(PlainTextNode(token.value));
      }

      // Check for stars
      if (token.isStar) parseStar(root, line);
    }

    return root;
  }
}

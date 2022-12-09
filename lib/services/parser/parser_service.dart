import 'package:takodana_engine/takodana_engine.dart';

part 'parser_service_star.dart';
part 'parser_service_header.dart';
part 'parser_service_hyphen.dart';
part 'parser_service_open_bracket.dart';
part 'parser_service_exlamation_mark.dart';

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
      var result = _parseLine(line, root.addChild(ParagraphNode()));
      _pointer = 0;

      if (result.children.length > 1) continue;

      if (result.children.isEmpty) {
        root.children.remove(result);
        continue;
      }

      root.children.remove(result);
      root.addChild(result.children.first);
    }

    return root;
  }

  SyntaxNode _parseLine(DocumentLine line, SyntaxNode root) {
    for (_pointer; _pointer < line.length; _pointer++) {
      var token = line[_pointer];

      // Check for header
      if (token.isHeader && _pointer == 0) parseHeader(root, line);

      // Check for stars
      if (token.isStar) parseStar(root, line);

      // Check for hyphens
      if (token.isHyphen) parseHyphen(root, line);

      // Check for open bracket
      if (token.isOpenBracket) parseOpenBracket(root, line);

      // Check for exclamation mark
      if (token.isExclamationMark) parseExclamationMark(root, line);

      if (token.isCloseBracket || token.isText || token.isOpenParenthesis || token.isCloseParenthesis || token.isSpace) {
        root.addChild(PlainTextNode(token.value));
      }
    }

    // get index of the first non-space node
    var index = root.children.indexWhere((e) => !(e is PlainTextNode && e.text == " "));

    if (index == -1 || index == 0) return root;

    // Get all spaces at the beginning of the line
    var spaces = root.children.takeWhile((e) => e is PlainTextNode && e.text == " ").toList();

    var node = root.children[index];

    // check if the first non-space node is node, that disallows spaces at the beginning of the line (e.g. bullet node)
    if (node is BulletNode || node is OrderdListItemNode) {
      // omit disallowed spaces
      for (var e in spaces) {
        root.children.remove(e);
      }
    }

    return root;
  }
}

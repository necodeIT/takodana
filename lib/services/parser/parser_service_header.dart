part of 'parser_service.dart';

extension _Header on ParserService {
  void parseHeader(SyntaxNode root) {
    var level = 1;
    var token = _line[_pointer];

    // count the number of #s  (level)
    while (hasNext() && next().isHeader) {
      level++;
      _pointer++;
    }

    /// Check if valid header
    if (level <= 6 && hasNext() && next().isSpace) {
      var header = HeaderNode("", level: level);

      _pointer++;

      // parse the header text
      root.addChild(_parseLine(_line, header));
    } else {
      var text = PlainTextNode(token.value * level);

      root.addChild(_parseLine(_line, text));
    }

    consumeLine();
  }
}

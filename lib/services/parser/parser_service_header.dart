part of 'parser_service.dart';

extension _Header on ParserService {
  void parseHeader(SyntaxNode root, DocumentLine line) {
    var level = 1;
    var token = line[_pointer];

    // count the number of #s  (level)
    while (line.hasNext() && line.next().isHeader) {
      level++;
      _pointer++;
    }

    /// Check if valid header
    if (level <= 6 && line.hasNext() && line.next().isSpace) {
      var header = HeaderNode(level: level);

      _pointer++;

      // parse the header text
      root.addChild(_parseLine(line, header));
    } else {
      var text = PlainTextNode(token.value * level);

      root.addChild(_parseLine(line, text));
    }

    line.consumeLine();
  }
}

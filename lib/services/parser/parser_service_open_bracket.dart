part of 'parser_service.dart';

extension _OpenBracket on ParserService {
  void parseOpenBracket(SyntaxNode root, DocumentLine line) {
    // check if it's a link
    // it's a link if there's
    //  - a closing bracket after the opening bracket
    //  - an opening parenthesis after the closing bracket
    //  - no space between the closing bracket and the opening parenthesis
    //  - a closing parenthesis after the opening parenthesis
    if (line.any((e) => e.isCloseBracket)) {
      var closingBracketIndex = line.indexWhere((e) => e.isCloseBracket, _pointer + 1);
      var openingParenthesisIndex = line.indexWhere((e) => e.isOpenParenthesis, closingBracketIndex + 1);
      var closingParenthesisIndex = line.indexWhere((e) => e.isCloseParenthesis, openingParenthesisIndex + 1);

      if (openingParenthesisIndex - 1 == closingBracketIndex && closingParenthesisIndex > openingParenthesisIndex) {
        _pointer++;
        var linkText = line.sublist(0, closingBracketIndex);
        var linkUrl = line.sublist(openingParenthesisIndex + 1, closingParenthesisIndex);

        // convert linkUrl to a string (not toString)
        var linkUrlString = linkUrl.map((e) => e.value).join();

        var link = LinkNode(href: linkUrlString);

        _parseLine(linkText, link);

        root.addChild(link);

        _pointer = closingParenthesisIndex + 1;
      } else {
        var text = PlainTextNode(line[_pointer].value);
        _pointer++;
        root.addChild(_parseLine(line, text));
      }

      return;
    }

    // if it's neither of the above, it's just plain text
    root.addChild(PlainTextNode(line[_pointer].value));
  }
}

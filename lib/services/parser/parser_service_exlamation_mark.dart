part of 'parser_service.dart';

extension _ExclamationMark on ParserService {
  void parseExclamationMark(SyntaxNode root, DocumentLine line) {
    // check if it's a link
    // it's a link if there's
    //  - a closing bracket after the opening bracket
    //  - an opening parenthesis after the closing bracket
    //  - no space between the closing bracket and the opening parenthesis
    //  - a closing parenthesis after the opening parenthesis
    if (line.hasNext() && line.next().isOpenBracket) {
      var closingBracketIndex = line.indexWhere((e) => e.isCloseBracket, _pointer + 2);
      var openingParenthesisIndex = line.indexWhere((e) => e.isOpenParenthesis, closingBracketIndex + 1);
      var closingParenthesisIndex = line.indexWhere((e) => e.isCloseParenthesis, openingParenthesisIndex + 1);

      if (openingParenthesisIndex - 1 == closingBracketIndex && closingParenthesisIndex > openingParenthesisIndex) {
        _pointer += 2;
        var imgText = line.sublist(_pointer, closingBracketIndex);
        var imgUrl = line.sublist(openingParenthesisIndex + 1, closingParenthesisIndex);

        // convert linkUrl to a string (not toString)
        var linkUrlString = imgUrl.map((e) => e.value).join();
        var altText = imgText.map((e) => e.value).join();

        var link = ImageNode(altText, src: linkUrlString);

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

part of takodana_engine;

/// Tokenizer service.
///
/// A tokenizer is a service that takes a string as input and returns a list of [Token]s.
class TokenizerService extends ITokenizerService {
  @override
  List<Token> tokenize(String input) {
    var tokens = <Token>[];

    for (var i = 0; i < input.length; i++) {
      var char = input[i];

      switch (char) {
        case '#':
          tokens.add(Token(value: char, type: TokenType.header));
          break;
        case '*':
          tokens.add(Token(value: char, type: TokenType.star));
          break;
        case '~':
          tokens.add(Token(value: char, type: TokenType.tilde));
          break;
        case '[':
          tokens.add(Token(value: char, type: TokenType.openBracket));
          break;
        case ']':
          tokens.add(Token(value: char, type: TokenType.closeBracket));
          break;
        case '(':
          tokens.add(Token(value: char, type: TokenType.openParenthesis));
          break;
        case ')':
          tokens.add(Token(value: char, type: TokenType.closeParenthesis));
          break;
        case '{':
          tokens.add(Token(value: char, type: TokenType.openCurlyBracket));
          break;
        case '}':
          tokens.add(Token(value: char, type: TokenType.closeCurlyBracket));
          break;
        case '=':
          tokens.add(Token(value: char, type: TokenType.highlight));
          break;
        case '-':
          tokens.add(Token(value: char, type: TokenType.hyphen));
          break;
        case '!':
          tokens.add(Token(value: char, type: TokenType.exclamation));
          break;
        case ' ':
          tokens.add(Token(value: char, type: TokenType.space));
          break;
        case '>':
          tokens.add(Token(value: char, type: TokenType.quote));
          break;
        case '^':
          tokens.add(Token(value: char, type: TokenType.caret));
          break;
        case '`':
          tokens.add(Token(value: char, type: TokenType.backtick));
          break;
        case '_':
          tokens.add(Token(value: char, type: TokenType.underscore));
          break;
        case '\r':
        case '\n':
          tokens.add(Token(value: char, type: TokenType.newLine));
          break;
        case '\t':
          tokens.add(Token(value: char, type: TokenType.tab));
          break;
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          var number = char;
          String? getNextChar() => i + 1 < input.length ? input[i + 1] : null;

          while (getNextChar() != null) {
            var nextChar = getNextChar()!;
            if (nextChar == '.') {
              number += nextChar;
              i++;
              break;
            }

            if (int.tryParse(nextChar) != null) {
              number += nextChar;
              i++;
            } else {
              break;
            }
          }

          if (number.endsWith('.')) {
            tokens.add(Token(value: number, type: TokenType.listNumber));
          } else {
            tokens.add(Token(value: number, type: TokenType.text));
          }
          break;

        default:
          tokens.add(Token(value: char, type: TokenType.text));
      }
    }

    return groupTextTokens(tokens);
  }
}

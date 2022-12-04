part of takodana_engine;

/// Tokenizer service.
///
/// A tokenizer is a service that takes a string as input and returns a list of [Token]s.
abstract class ITokenizerService {
  /// Tokenizes the given [input] into a list of [Token]s.
  List<Token> tokenize(String input);

  /// Groups all text tokens next to each other into a single token.
  ///
  /// Also groups spaces next to text tokens into a single token.
  List<Token> groupTextTokens(List<Token> tokens) {
    var groupedTokens = <Token>[];
    var text = "";

    for (var i = 0; i < tokens.length; i++) {
      var token = tokens[i];

      if (token.type == TokenType.text || (token.isSpace && text.isNotEmpty)) {
        text += token.value;
      } else {
        if (text.isNotEmpty) {
          groupedTokens.add(Token(value: text, type: TokenType.text));
          text = "";
        }

        groupedTokens.add(token);
      }
    }

    return groupedTokens;
  }
}

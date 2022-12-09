part of takodana_engine;

class TokenPattern {
  final List<TokenPattern>? openPattern;

  final List<TokenPattern>? closePattern;

  final Token? token;
  final int? amount;

  TokenPattern(this.openPattern, this.closePattern)
      : token = null,
        amount = null;

  TokenPattern.token(this.token, {this.amount = 1})
      : openPattern = null,
        closePattern = null;
}

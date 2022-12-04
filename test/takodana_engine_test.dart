import 'package:flutter_test/flutter_test.dart';
import 'package:takodana_engine/takodana_engine.dart';

void main() {
  group("Parsing", () {
    var sample = '''
# Header
## Subheader
### *Subsubheader*
- Bullet
  - Bullet 2
    - Bullet 3
*Star*
1. Numbered
> Quote
^Caret
`Fence`
[Link](https://google.com)
''';

    test("Tokenizer", () {
      var tokenizer = TokenizerService();
      var tokens = tokenizer.tokenize(sample);

      print(tokens);

      expect(tokens.length, 61);
    });

    test('AST', () {
      var tokenizer = TokenizerService();
      var tokens = tokenizer.tokenize(sample);

      print(tokens);

      var parser = ParserService();

      var ast = parser.parse(tokens);

      print(ast);
    });
  });
}

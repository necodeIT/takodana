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
*Italic*
**Bold**
***Bold Italic***
1. Numbered
> Quote
^Caret
`Fence`
[Link](https://google.com)
[Not a link] (https://google.com)
 ![img](https://preview.redd.it/bnhlv4c2mtk61.jpg?width=640&crop=smart&auto=webp&s=39dc78bb3d04b2be63699536d304f460473667ff)
! [not an img but a link](https://preview.redd.it/bnhlv4c2mtk61.jpg?width=640&crop=smart&auto=webp&s=39dc78bb3d04b2be63699536d304f460473667ff)
2 - 3 = -1
''';

    test("Tokenizer", () {
      var tokenizer = TokenizerService();
      var tokens = tokenizer.tokenize(sample);

      print(tokens);
    });

    test('AST', () {
      var tokenizer = TokenizerService();
      var tokens = tokenizer.tokenize(sample);

      var parser = ParserService();

      var ast = parser.parse(tokens);

      print(ast);
    });
  });
}

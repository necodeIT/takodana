import 'package:flutter_test/flutter_test.dart';
import 'package:takodana_engine/takodana_engine.dart';

void main() {
  var sample = '''
# Header
## Subheader
### Subsubheader
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

  test("Tokenizer test", () {
    var tokenizer = TokenizerService();
    var tokens = tokenizer.tokenize(sample);

    print(tokens);
  });
}

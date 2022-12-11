import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
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
  2 - 3 = -1 *sdasd* **sdasdas** [Link](https://google.com)
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

    group("Performance", () {
      test('${sample.length} characters', () {
        mesurePerformance(sample);
      });

      test('Normal sized document', () async {
        var doc = await getDocument(1);

        mesurePerformance(doc);
      });

      test('Large document', () async {
        var doc = await getDocument(10);

        mesurePerformance(doc);
      });

      test('Huge document', () async {
        var doc = await getDocument(50);

        mesurePerformance(doc);
      });
    });
  });
}

void mesurePerformance(String sample) {
  var tokenizer = TokenizerService();

  var words = sample.split(" ");

  var stopwatch = Stopwatch()..start();
  var tokens = tokenizer.tokenize(sample);

  stopwatch.stop();
  var totalTime = stopwatch.elapsed.inMilliseconds;
  print('Tokenizing took ${stopwatch.elapsed.inMilliseconds}ms');

  var parser = ParserService();

  stopwatch = Stopwatch()..start();
  parser.parse(tokens);

  stopwatch.stop();
  totalTime += stopwatch.elapsed.inMilliseconds;
  print('Parsing took ${stopwatch.elapsed.inMilliseconds}ms');

  print('Total time: ${totalTime}ms for ${words.length} words (${words.length / totalTime} words/ms) ');
}

/// Retrieves documents from https://jaspervdj.be/lorem-markdownum/markdown-html.html
/// and combines them into one large document.
Future<String> getDocument(int size) async {
  const url = 'https://jaspervdj.be/lorem-markdownum/markdown-html.html';

  final uri = Uri.parse(url);

  var documents = "";

  for (var i = 0; i < size; i++) {
    final response = await get(uri);

    if (response.statusCode != 200) throw Exception({'Failed to get document': response.statusCode, 'body': response.body});

    var document = response.body.replaceAll('<pre class="markdown">', "").split('</pre>')[0];

    documents += document;
  }

  return documents;
}

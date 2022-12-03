part of takodana_engine;

/// Creates a new [FencedCodeBlockNode].
///
/// e.g.
///
/// \``` dart
///
///     print('Hello World');
/// \```
class FencedCodeBlockNode extends SyntaxNode {
  /// The language of the code block.
  ///
  /// ---
  ///
  /// \``` dart
  ///
  ///     print('Hello World');
  /// \```
  ///
  /// The language of the code block is `dart`.
  ///
  /// ---
  ///
  ///
  /// \``` python
  ///
  ///    print('Hello World')
  ///
  /// \```
  ///
  /// The language of the code block is `python`.
  final String language;

  /// Creates a new [FencedCodeBlockNode].
  ///
  /// e.g.
  ///
  /// \``` dart
  ///
  ///     print('Hello World');
  /// \```
  FencedCodeBlockNode(String text, {required this.language}) : super(text);

  @override
  String _paramsToString() => language;
}

part of takodana_engine;

/// A line consiting of tokens of a document.
///
/// This class provides some utility methods to parse the line.
class DocumentLine implements Iterable<Token> {
  final int Function() _getPointer;
  final Function(int) _setPointer;

  int get _pointer => _getPointer();
  set _pointer(int value) => _setPointer(value);

  /// The tokens of the line
  final List<Token> tokens;

  DocumentLine(this.tokens, this._getPointer, this._setPointer);

  Token operator [](int index) => tokens[index];

  /// The first index in the list that satisfies the provided [test].
  ///
  /// Searches the list from index [start] to the end of the list.
  /// The first time an object `o` is encountered so that `test(o)` is true,
  /// the index of `o` is returned.
  ///
  /// ```dart
  /// final notes = <String>['do', 're', 'mi', 're'];
  /// final first = notes.indexWhere((note) => note.startsWith('r')); // 1
  /// final second = notes.indexWhere((note) => note.startsWith('r'), 2); // 3
  /// ```
  ///
  /// Returns -1 if [element] is not found.
  /// ```dart
  /// final notes = <String>['do', 're', 'mi', 're'];
  /// final index = notes.indexWhere((note) => note.startsWith('k')); // -1
  /// ```
  int indexWhere(bool Function(Token) test, [int start = 0]) => tokens.indexWhere(test, start);

  @override
  int get length => tokens.length;

  DocumentLine sublist(int start, [int? end]) => DocumentLine(tokens.sublist(start, end), _getPointer, _setPointer);

  @override
  bool get isEmpty => tokens.isEmpty;

  @override
  bool get isNotEmpty => tokens.isNotEmpty;

  /// Checks if there's a next token in the line.
  bool hasNext([int delta = 1]) => _pointer + delta >= 0 && _pointer + delta < length;

  /// Returns the next token of the line.
  ///
  /// Beware, this method throws if there are no tokens anymore, so make sure to check it first using [hasNext]
  Token next([int delta = 1]) => this[_pointer + delta];

  /// Consumes the current line and goes to the next line
  void consumeLine() => _pointer = length - 1;

  /// Adds a token to the line
  void add(Token token) => tokens.add(token);

  @override
  String toString() {
    return tokens.map((e) => e.value).join("\n");
  }

  @override
  bool any(test) => tokens.any(test);

  @override
  Iterable<R> cast<R>() => tokens.cast<R>();

  @override
  bool contains(Object? element) => tokens.contains(element);

  @override
  Token elementAt(int index) => tokens.elementAt(index);

  @override
  bool every(test) => tokens.every(test);

  @override
  Iterable<T> expand<T>(toElements) => tokens.expand(toElements);

  @override
  Token get first => tokens.first;

  @override
  Token firstWhere(test, {orElse}) => tokens.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue, T Function(T previousValue, Token element) combine) => tokens.fold(initialValue, combine);
  @override
  Iterable<Token> followedBy(Iterable<Token> other) => tokens.followedBy(other);
  @override
  void forEach(void Function(Token element) action) => tokens.forEach(action);

  @override
  Iterator<Token> get iterator => tokens.iterator;

  @override
  String join([String separator = ""]) => tokens.join(separator);

  @override
  Token get last => throw UnimplementedError();

  @override
  Token lastWhere(bool Function(Token element) test, {Token Function()? orElse}) => tokens.lastWhere(test, orElse: orElse);

  @override
  Iterable<T> map<T>(T Function(Token e) toElement) => tokens.map(toElement);
  @override
  Token reduce(Token Function(Token value, Token element) combine) => tokens.reduce(combine);

  @override
  Token get single => tokens.single;

  @override
  Token singleWhere(bool Function(Token element) test, {Token Function()? orElse}) => tokens.singleWhere(test, orElse: orElse);

  @override
  Iterable<Token> skip(int count) => tokens.skip(count);

  @override
  Iterable<Token> skipWhile(bool Function(Token value) test) => tokens.skipWhile(test);
  @override
  Iterable<Token> take(int count) => tokens.take(count);

  @override
  Iterable<Token> takeWhile(bool Function(Token value) test) => tokens.takeWhile(test);

  @override
  List<Token> toList({bool growable = true}) => tokens.toList(growable: growable);

  @override
  Set<Token> toSet() => tokens.toSet();

  @override
  Iterable<Token> where(bool Function(Token element) test) => tokens.where(test);

  @override
  Iterable<T> whereType<T>() => tokens.whereType<T>();
}

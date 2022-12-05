part of 'parser_service.dart';

extension _Helper on ParserService {
  /// Checks if there's a next token in the line.
  bool hasNext() => _pointer + 1 < _line.length;

  /// Returns the next token of the line.
  ///
  /// Beware, this method throws if there are no tokens anymore, so make sure to check it first using [hasNext]
  Token next() => _line[_pointer + 1];

  /// Consumes the current line and goes to the next line
  void consumerLine() => _pointer = _line.length - 1;
}

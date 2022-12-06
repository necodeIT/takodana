part of 'parser_service.dart';

extension _Helper on ParserService {
  /// Checks if there's a next token in the line.
  bool hasNext([int delta = 1]) => _pointer + delta >= 0 && _pointer + delta < _line.length;

  /// Returns the next token of the line.
  ///
  /// Beware, this method throws if there are no tokens anymore, so make sure to check it first using [hasNext]
  Token next([int delta = 1]) => _line[_pointer + delta];

  /// Consumes the current line and goes to the next line
  void consumeLine() => _pointer = _line.length - 1;
}

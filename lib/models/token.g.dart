// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      value: json['value'] as String,
      type: $enumDecode(_$TokenTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'value': instance.value,
      'type': _$TokenTypeEnumMap[instance.type]!,
    };

const _$TokenTypeEnumMap = {
  TokenType.text: 'text',
  TokenType.star: 'star',
  TokenType.openBracket: 'openBracket',
  TokenType.closeBracket: 'closeBracket',
  TokenType.openParenthesis: 'openParenthesis',
  TokenType.closeParenthesis: 'closeParenthesis',
  TokenType.openCurlyBracket: 'openCurlyBracket',
  TokenType.closeCurlyBracket: 'closeCurlyBracket',
  TokenType.highlight: 'highlight',
  TokenType.header: 'header',
  TokenType.newLine: 'newLine',
  TokenType.hyphen: 'hyphen',
  TokenType.listNumber: 'listNumber',
  TokenType.fence: 'fence',
  TokenType.quote: 'quote',
  TokenType.tilde: 'tilde',
  TokenType.caret: 'caret',
  TokenType.space: 'space',
  TokenType.tab: 'tab',
  TokenType.underscore: 'underscore',
  TokenType.exclamation: 'exclamation',
};

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:takodana_engine/takodana_engine.dart';
import 'package:flutter/services.dart';

void main() async {
  var root = SyntaxNode.root();

  root.addChild(HeaderNode("Header1", 1));
  var bold1 = root.addChild(BoldNode("BoldText1"));
  root.addChild(BoldNode("BoldText2"));
  bold1.addChild(BoldNode("BoldText3"));
  bold1.addChild(BoldNode("Lorem ipsum"));
  var h2 = root.addChild(HeaderNode("Your mom", 2));
  h2.addSibling(BoldNode("test"));

  print(root);
}

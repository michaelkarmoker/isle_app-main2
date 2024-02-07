
import 'package:html/parser.dart';
class HtmlTags {

  static String removeTag({ htmlString }){
    var document = parse(htmlString);
    String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
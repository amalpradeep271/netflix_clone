import 'package:netflix_clone/data/tv/models/keyword.dart';
import 'package:netflix_clone/domain/tv/enitities/keyword.dart';

class KeywordMapper {
 static KeywordEntity toEntity(KeywordModel keyword) {
    return KeywordEntity(
      name: keyword.name,
      id: keyword.id,
    );
  }
}

import 'package:netflix_clone/data/movie/models/trailer.dart';
import 'package:netflix_clone/domain/movie/entities/trailer.dart';

class TrailerMapper {
  static TrailerEntity toEntity(TrailerModel trailer) {
    return TrailerEntity(
        iso6391: trailer.iso6391,
        iso31661: trailer.iso31661,
        name: trailer.name,
        key: trailer.key,
        site: trailer.site,
        size: trailer.size,
        type: trailer.type,
        official: trailer.official,
        publishedAt: trailer.publishedAt,
        id: trailer.id);
  }
}

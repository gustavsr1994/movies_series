import 'package:equatable/equatable.dart';

class SeriesEntity extends Equatable {
  final int id;
  final String title;
  final String imagePoster;
  final String firstOnAirDate;
  final String popularity;
  final String content;

  SeriesEntity(
      {this.id,
      this.title,
      this.imagePoster,
      this.firstOnAirDate,
      this.popularity,
      this.content});

  @override
  List<Object> get props => [id, title, imagePoster, firstOnAirDate, content, popularity];
}

class SeriesDetailEntity extends Equatable {
  final int id;
  final String title;
  final String createdBy;
  final List<String> listGenre;
  final List<String> listProductionCompanies;
  final List<String> listProductionCountries;
  final List<SeriesSeasonEntity> listSeason;
  final String content;
  final String status;
  final List<SeriesReviewEntity> listReview;

  SeriesDetailEntity(
      {this.id,
      this.title,
      this.createdBy,
      this.listGenre,
      this.listProductionCompanies,
      this.listProductionCountries,
      this.listSeason,
      this.content,
      this.status,
      this.listReview});

  @override
  List<Object> get props => [
        id,
        title,
        createdBy,
        listGenre,
        listProductionCompanies,
        listProductionCountries,
        listSeason,
        content,
        status,
        listReview
      ];
}

class SeriesSeasonEntity extends Equatable {
  final String nameSeason;
  final int episodes;
  final String airDate;
  SeriesSeasonEntity({this.nameSeason, this.episodes, this.airDate});
  @override
  List<Object> get props => [nameSeason, episodes, airDate];
}

class SeriesReviewEntity extends Equatable {
  final int id;
  final String author;
  final int rating;
  final String content;
  final String url;

  SeriesReviewEntity(
      {this.id, this.author, this.rating, this.content, this.url});

  @override
  List<Object> get props => [id, author, content, rating, url];
}

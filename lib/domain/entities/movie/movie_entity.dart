import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final bool adult;
  final String title;
  final String releaseDate;
  final String popularity;
  final String content;

  MovieEntity(
      {this.id,
      this.adult,
      this.title,
      this.releaseDate,
      this.popularity,
      this.content});

  @override
  List<Object> get props =>
      [id, adult, title, releaseDate, content, popularity];
}

class MovieDetailEntity extends Equatable {
  final int id;
  final bool adult;
  final String title;
  final List<String> listGenre;
  final List<String> listProductionCompanies;
  final List<String> listProductionCountries;
  final String content;
  final String status;
  final List<MovieReviewEntity> listReview;

  MovieDetailEntity(
      {this.id,
      this.adult,
      this.title,
      this.listGenre,
      this.listProductionCompanies,
      this.listProductionCountries,
      this.content,
      this.status,
      this.listReview});

  @override
  List<Object> get props => [
        id,
        adult,
        title,
        listGenre,
        listProductionCompanies,
        listProductionCountries,
        content,
        status,
        listReview
      ];
}

class MovieReviewEntity extends Equatable {
  final String author;
  final int rating;
  final String content;
  final String url;

  MovieReviewEntity(
      {this.author, this.rating, this.content, this.url});

  @override
  List<Object> get props => [author, content, rating, url];
}

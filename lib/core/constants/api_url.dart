class ApiUrl {
  static const baseUrl =
      "https://netflix-backend-production-8413.up.railway.app/";
  static const signup =
      "https://netflix-backend-production-8413.up.railway.app/api/v1/auth/signup";

  static const signin =
      "https://netflix-backend-production-8413.up.railway.app/api/v1/auth/signin";

  static const tmdbBaseUrl = "https://api.themoviedb.org/3";
  static const trendingMovies = "$tmdbBaseUrl/trending/movie/day";
  static const nowplayingMovies = "$tmdbBaseUrl/movie/now_playing";
  static const popularTv = "$tmdbBaseUrl/tv/popular";
  static const movieTrailer = "$tmdbBaseUrl/movie/";
  static const getTvTrailer="$tmdbBaseUrl/tv/";
  static const recommendatioMovie = "$tmdbBaseUrl/movie/";
  static const tvBase = "$tmdbBaseUrl/tv/";
  static const searchMovies = "$tmdbBaseUrl/search/movie?query=";
  static const searchTvs = "$tmdbBaseUrl/search/tv?query=";
}

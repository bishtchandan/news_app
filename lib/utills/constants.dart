class Constants {
  static const apiKey = 'df5530980c694a9aa352418da42daa53';
  static const String topHeadingUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';
  
  static headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey';
  }

  static const Map<String, String> Countries = {
    "USA" : "us",
    "India" : "in",
    "korea" : "kr",
    "China" : "ch",
  };
}
class APIURL {
  static const String baseURL = "https://api.unsplash.com/photos";
  static const String clientId = "it3EQ8VMjWiGKEU8-tpRxeLyUwYe47_jSiTTz76zlOg";
  static const String perPage = "5";
  static const String perBackgroundPage = "30";

  static const eventBaseURL = "https://days-app-api.herokuapp.com";

  static String getUrl(String destination) {
    return "$baseURL/$destination";
  }

  static String url(String destination) {
    return "$eventBaseURL/$destination";
  }

  static dynamic headerWithToken() {
    var map = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    return map;
  }

  static dynamic get headerWithoutToken {
    var map = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    return map;
  }
}

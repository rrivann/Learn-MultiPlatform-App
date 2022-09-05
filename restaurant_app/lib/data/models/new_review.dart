class NewReview {
  NewReview({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  bool error;
  String message;
  List<CustomerReviewNew> customerReviews;

  factory NewReview.fromJson(Map<String, dynamic> json) => NewReview(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReviewNew>.from(
            json["customerReviews"].map((x) => CustomerReviewNew.fromJson(x))),
      );
}

class CustomerReviewNew {
  CustomerReviewNew({
    required this.name,
    required this.review,
    required this.date,
  });

  String name;
  String review;
  String date;

  factory CustomerReviewNew.fromJson(Map<String, dynamic> json) =>
      CustomerReviewNew(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
}

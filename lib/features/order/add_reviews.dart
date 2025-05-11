import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  int selectedRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  void submitReview() {
    // Add your backend or review logic here
    final reviewText = _reviewController.text;
    final rating = selectedRating;
    print("Review submitted: $rating stars, comment: $reviewText");

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Review submitted!")),
    );

    Navigator.pop(context);
  }

  Widget buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        return IconButton(
          icon: Icon(
            starIndex <= selectedRating ? Icons.star : Icons.star_border,
            color: Colors.pink,
            size: 32,
          ),
          onPressed: () {
            setState(() => selectedRating = starIndex);
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Review", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item info section (customize as needed)
            Row(
              children: [
                Container(
                  width: 60,
                  height: 80,
                  color: Colors.grey[300],
                  child: Icon(Icons.book, size: 40),
                ),
                const SizedBox(width: 16),
                Text("Book Title", style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 24),
            Text("Rate this item",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            buildStarRating(),
            const SizedBox(height: 24),
            Text("Write a review",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Share your experience...",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text("Submit Review", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

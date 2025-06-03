import 'package:alerto_emergency_response_app/core/utils/global_variable.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_textform.dart';
import '../../../../widgets/rounded_button.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  Widget _buildStar(int index) {
    return IconButton(
      icon: Icon(
        index < _rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 36,
      ),
      onPressed: () {
        setState(() {
          _rating = index + 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back if needed
          },
        ),
        title: Text('Review'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildStar(0),
                _buildStar(1),
                _buildStar(2),
                _buildStar(3),
                _buildStar(4),
              ],
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                '$_rating/5.0',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 8),
            Text("How was the service?", style: textTheme(context).bodyMedium),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: "It is important...",
              keyboard: TextInputType.text,
              controller: _reviewController,
              maxLine: 5,
            ),
            SizedBox(height: 24),

            CustomButton(
              pressed: () {
                // Handle submit logic here (e.g., send data to a server)
                print('Rating: $_rating');
                print('Review: ${_reviewController.text}');
                // Optionally navigate to the ratings screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RatingsScreen()),
                );
              },
              width: double.infinity,
              height: 60,
              bgColor: colorScheme(context).primary,
              color: colorScheme(context).primary,
              child: Text("Submit", style: textTheme(context).labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingsScreen extends StatelessWidget {
  // Dummy data for ratings and reviews
  final double averageRating = 4.0;
  final int totalReviews = 51;
  final List<Review> reviews = [
    Review(
      name: 'John Wick',
      rating: 4.9,
      date: '1 week ago',
      comment:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.',
      profileImage: 'https://via.placeholder.com/40/0000FF/FFFFFF?Text=JW', // Placeholder image
    ),
    // Add more reviews here
  ];

  RatingsScreen({super.key});

  Widget _buildStarDisplay(BuildContext context, double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : (index < rating + 0.5 ? Icons.star_half : Icons.star_border),
          color:colorScheme(context).primary,
          size: 20,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Ratings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Your Ratings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                _buildStarDisplay(context,4.0), // Assuming user's rating is 4.0
                SizedBox(width: 8),
                Text('4.0 stars out of 5', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Average Rating: $averageRating',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('$averageRating • $totalReviews reviews', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: NetworkImage(review.profileImage),
                            ),
                            SizedBox(width: 8),
                            Text(review.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            _buildStarDisplay(context,review.rating),
                            SizedBox(width: 4),
                            Text('${review.rating}', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(review.date, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                        SizedBox(height: 8),
                        Text(review.comment),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Center(
              child: InkWell(
                onTap: () {
                  // Handle view all reviews action
                  print('View All $totalReviews Reviews');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'View All $totalReviews Reviews',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Review {
  final String name;
  final double rating;
  final String date;
  final String comment;
  final String profileImage;

  Review({
    required this.name,
    required this.rating,
    required this.date,
    required this.comment,
    required this.profileImage,
  });
}
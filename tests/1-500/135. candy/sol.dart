class Solution {
  int candy(List<int> ratings) {
    final candies = List.filled(ratings.length, 1);
    for (var i = 1; i < ratings.length; i++) if (ratings[i] > ratings[i - 1]) candies[i] = candies[i - 1] + 1;
    for (var i = ratings.length - 2; i >= 0; i--) if (ratings[i] > ratings[i + 1] && candies[i] < candies[i + 1] + 1) candies[i] = candies[i + 1] + 1;
    return candies.fold(0, (sum, value) => sum + value);
  }
}

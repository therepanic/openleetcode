class Solution {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    int currentMax = candies.reduce((a, b) => a > b ? a : b);
    List<bool> result = [];
    for (int candyCount in candies) {
      if (candyCount + extraCandies >= currentMax) {
        result.add(true);
      } else {
        result.add(false);
      }
    }
    return result;
  }
}

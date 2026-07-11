class Solution {
  List<int> distributeCandies(int candies, int num_people) {
    List<int> res = List.filled(num_people, 0);
    int give = 1;
    int i = 0;

    while (candies > 0) {
      res[i % num_people] += give < candies ? give : candies;
      candies -= give;
      give++;
      i++;
    }

    return res;
  }
}

class Solution {
  int distributeCandies(List<int> candyType) {
    int n = candyType.length;
    int k = n ~/ 2;
    var set = candyType.toSet();
    return k < set.length ? k : set.length;
  }
}

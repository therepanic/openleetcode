class Solution {
  List<int> mostVisited(int n, List<int> rounds) {
    int s = rounds[0];
    int e = rounds[rounds.length - 1];
    if (s <= e) {
      return List.generate(e - s + 1, (i) => s + i);
    } else {
      return List.generate(e, (i) => i + 1) + List.generate(n - s + 1, (i) => s + i);
    }
  }
}

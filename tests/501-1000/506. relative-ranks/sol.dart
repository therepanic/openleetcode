class Solution {
  List<String> findRelativeRanks(List<int> score) {
    int n = score.length;
    List<int> sorted = List.from(score);
    sorted.sort((a, b) => b.compareTo(a));
    Map<int, String> ranks = {};
    for (int i = 0; i < n; i++) {
      ranks[sorted[i]] = (i + 1).toString();
    }
    ranks[sorted[0]] = "Gold Medal";
    if (n > 1) ranks[sorted[1]] = "Silver Medal";
    if (n > 2) ranks[sorted[2]] = "Bronze Medal";
    return score.map((s) => ranks[s]!).toList();
  }
}

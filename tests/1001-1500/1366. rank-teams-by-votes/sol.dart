class Solution {
  String rankTeams(List<String> votes) {
    String teams = votes[0];
    int n = teams.length;
    Map<String, List<int>> positions = {};
    for (var team in teams.split('')) {
      positions[team] = List.filled(n, 0);
    }
    for (var vote in votes) {
      for (int i = 0; i < n; i++) {
        String team = vote[i];
        positions[team]![i]++;
      }
    }
    List<String> sortedTeams = teams.split('');
    sortedTeams.sort((a, b) {
      List<int> countsA = positions[a]!;
      List<int> countsB = positions[b]!;
      for (int i = 0; i < n; i++) {
        if (countsA[i] != countsB[i]) {
          return countsB[i] - countsA[i];
        }
      }
      return a.codeUnitAt(0) - b.codeUnitAt(0);
    });
    return sortedTeams.join('');
  }
}

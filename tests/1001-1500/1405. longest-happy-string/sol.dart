class Solution {
  String longestDiverseString(int a, int b, int c) {
    final counts = [a, b, c];
    const letters = ['a', 'b', 'c'];
    final result = <String>[];
    while (true) {
      var choice = -1;
      for (var i = 0; i < 3; i++) {
        if (counts[i] == 0) continue;
        if (result.length >= 2 && result[result.length - 1] == letters[i] && result[result.length - 2] == letters[i]) continue;
        if (choice == -1 || counts[i] > counts[choice]) choice = i;
      }
      if (choice == -1) break;
      result.add(letters[choice]);
      counts[choice]--;
    }
    return result.join();
  }
}

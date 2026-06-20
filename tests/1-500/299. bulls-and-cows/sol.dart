class Solution {
  String getHint(String secret, String guess) {
    int bulls = 0;
    List<int> secretCounts = List.filled(10, 0);
    List<int> guessCounts = List.filled(10, 0);

    for (int i = 0; i < secret.length; i++) {
      String s = secret[i];
      String g = guess[i];
      if (s == g) {
        bulls++;
      } else {
        secretCounts[int.parse(s)]++;
        guessCounts[int.parse(g)]++;
      }
    }

    int cows = 0;
    for (int i = 0; i < 10; i++) {
      cows += secretCounts[i] < guessCounts[i] ? secretCounts[i] : guessCounts[i];
    }
    return '${bulls}A${cows}B';
  }
}

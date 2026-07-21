class Solution {
  int numberWays(List<List<int>> hats) {
    const int mod = 1000000007;
    int n = hats.length;
    List<List<int>> likedByHat = List.generate(41, (_) => []);
    for (int person = 0; person < n; person++) {
      for (int hat in hats[person]) {
        likedByHat[hat].add(person);
      }
    }
    
    List<int> dp = List.filled(1 << n, 0);
    dp[0] = 1;
    for (int hat = 1; hat <= 40; hat++) {
      List<int> updated = List.from(dp);
      for (int mask = 0; mask < (1 << n); mask++) {
        int count = dp[mask];
        if (count == 0) continue;
        for (int person in likedByHat[hat]) {
          int personBit = 1 << person;
          if ((mask & personBit) == 0) {
            int target = mask | personBit;
            updated[target] = (updated[target] + count) % mod;
          }
        }
      }
      dp = updated;
    }
    return dp.last;
  }
}

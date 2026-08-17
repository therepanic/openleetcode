class Solution {
  int maxHappyGroups(int batchSize, List<int> groups) {
    List<int> counts = List.filled(batchSize, 0);
    int happyCount = 0;
    for (int g in groups) {
      int rem = g % batchSize;
      if (rem == 0) {
        happyCount++;
      } else {
        counts[rem]++;
      }
    }
    
    for (int i = 1; i <= batchSize ~/ 2; i++) {
      if (i == batchSize - i) {
        int pairCount = counts[i] ~/ 2;
        happyCount += pairCount;
        counts[i] %= 2;
      } else {
        int pairCount = counts[i] < counts[batchSize - i] ? counts[i] : counts[batchSize - i];
        happyCount += pairCount;
        counts[i] -= pairCount;
        counts[batchSize - i] -= pairCount;
      }
    }
    
    List<int> state = counts.sublist(1);
    Map<String, int> memo = {};
    return happyCount + _viterbi(state, 0, batchSize, memo);
  }
  
  int _viterbi(List<int> counts, int leftover, int batchSize, Map<String, int> memo) {
    String key = counts.join(',') + ',' + leftover.toString();
    if (memo.containsKey(key)) return memo[key]!;
    
    int sum = 0;
    for (int c in counts) sum += c;
    if (sum == 0) {
      memo[key] = 0;
      return 0;
    }
    
    int res = 0;
    for (int i = 0; i < counts.length; i++) {
      if (counts[i] > 0) {
        int rem = i + 1;
        List<int> next = List.from(counts);
        next[i]--;
        
        int isHappy = (leftover == 0) ? 1 : 0;
        int newLeftover = (leftover + rem) % batchSize;
        
        int val = isHappy + _viterbi(next, newLeftover, batchSize, memo);
        if (val > res) res = val;
      }
    }
    memo[key] = res;
    return res;
  }
}

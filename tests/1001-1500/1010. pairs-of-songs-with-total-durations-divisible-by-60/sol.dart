class Solution {
  int numPairsDivisibleBy60(List<int> time) {
    List<int> remainders = List.filled(60, 0);
    for (int t in time) {
      remainders[t % 60]++;
    }
    
    int count = 0;
    count += remainders[0] * (remainders[0] - 1) ~/ 2;
    count += remainders[30] * (remainders[30] - 1) ~/ 2;
    
    for (int i = 1; i < 30; i++) {
      count += remainders[i] * remainders[60 - i];
    }
    
    return count;
  }
}

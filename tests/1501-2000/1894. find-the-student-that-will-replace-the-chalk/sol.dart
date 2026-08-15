class Solution {
  int chalkReplacer(List<int> chalk, int k) {
    int total = chalk.fold(0, (a, b) => a + b);
    int remaining = k % total;
    for (int i = 0; i < chalk.length; i++) {
      if (remaining < chalk[i]) return i;
      remaining -= chalk[i];
    }
    return 0;
  }
}

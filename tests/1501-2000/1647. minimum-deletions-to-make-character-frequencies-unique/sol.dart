class Solution {
  int minDeletions(String s) {
    List<int> count = List.filled(26, 0);
    for (int i = 0; i < s.length; i++) {
      count[s.codeUnitAt(i) - 97]++;
    }
    List<int> freqs = count.where((f) => f > 0).toList()..sort((a, b) => b.compareTo(a));
    int deletes = 0;
    for (int idx = 1; idx < freqs.length; idx++) {
      if (freqs[idx] >= freqs[idx - 1]) {
        int target = max(0, freqs[idx - 1] - 1);
        deletes += (freqs[idx] - target);
        freqs[idx] = target;
      }
    }
    return deletes;
  }
}

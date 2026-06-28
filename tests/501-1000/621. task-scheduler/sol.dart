class Solution {
  int leastInterval(List<String> tasks, int n) {
    final count = <String, int>{};
    for (final t in tasks) {
      count[t] = (count[t] ?? 0) + 1;
    }
    final values = count.values;
    final f_max = values.reduce((a, b) => a > b ? a : b);
    final max_count = values.where((v) => v == f_max).length;
    return [tasks.length, (f_max - 1) * (n + 1) + max_count]
        .reduce((a, b) => a > b ? a : b);
  }
}

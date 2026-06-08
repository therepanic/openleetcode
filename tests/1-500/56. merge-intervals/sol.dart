class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    intervals.sort((a, b) => a[0].compareTo(b[0]));
    final merged = <List<int>>[];

    for (final interval in intervals) {
      if (merged.isEmpty || merged.last[1] < interval[0]) {
        merged.add([interval[0], interval[1]]);
      } else if (interval[1] > merged.last[1]) {
        merged.last[1] = interval[1];
      }
    }

    return merged;
  }
}

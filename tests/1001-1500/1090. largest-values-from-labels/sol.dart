class Solution {
  int largestValsFromLabels(List<int> values, List<int> labels, int numWanted, int useLimit) {
    int n = values.length;
    List<List<int>> pairs = [];
    for (int i = 0; i < n; i++) {
      pairs.add([values[i], labels[i]]);
    }
    pairs.sort((a, b) => b[0].compareTo(a[0]));
    int res = 0;
    Map<int, int> freq = {};
    for (var pair in pairs) {
      if (numWanted == 0) break;
      int value = pair[0];
      int label = pair[1];
      if (!freq.containsKey(label) || freq[label]! < useLimit) {
        res += value;
        freq[label] = (freq[label] ?? 0) + 1;
        numWanted--;
      }
    }
    return res;
  }
}

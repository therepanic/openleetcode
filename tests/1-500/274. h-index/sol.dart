class Solution {
  int hIndex(List<int> citations) {
    citations.sort((a, b) => b.compareTo(a));
    int count = 0;
    for (int i = 0; i < citations.length; i++) {
      if (citations[i] >= i + 1) {
        count = i + 1;
      } else {
        break;
      }
    }
    return count;
  }
}

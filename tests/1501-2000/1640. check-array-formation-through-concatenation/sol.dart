class Solution {
  bool canFormArray(List<int> arr, List<List<int>> pieces) {
    List<int> a = [];
    List<List<int>> remaining = List.from(pieces);
    for (int i in arr) {
      for (int j = 0; j < remaining.length; j++) {
        if (remaining[j].contains(i)) {
          a.addAll(remaining[j]);
          remaining.removeAt(j);
          break;
        }
      }
    }
    if (a.length != arr.length) return false;
    for (int idx = 0; idx < a.length; idx++) {
      if (a[idx] != arr[idx]) return false;
    }
    return true;
  }
}

class Solution {
  bool checkIfExist(List<int> arr) {
    if (arr.where((e) => e == 0).length >= 2) return true;

    for (var i in arr) {
      if (i != 0 && arr.contains(i * 2)) {
        return true;
      }
    }
    return false;
  }
}

class Solution {
  List<int> findClosestElements(List<int> arr, int k, int x) {
    var list = List<int>.from(arr);
    list.sort((a, b) {
      int da = (a - x).abs();
      int db = (b - x).abs();
      if (da != db) return da.compareTo(db);
      return a.compareTo(b);
    });
    var result = list.sublist(0, k);
    result.sort();
    return result;
  }
}

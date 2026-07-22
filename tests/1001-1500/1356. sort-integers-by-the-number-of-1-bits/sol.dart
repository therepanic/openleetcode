class Solution {
  List<int> sortByBits(List<int> arr) {
    arr.sort((a, b) {
      int ca = a.bitLength == 0 ? 0 : a.toRadixString(2).replaceAll('0', '').length;
      int cb = b.bitLength == 0 ? 0 : b.toRadixString(2).replaceAll('0', '').length;
      if (ca != cb) return ca - cb;
      return a - b;
    });
    return arr;
  }
}

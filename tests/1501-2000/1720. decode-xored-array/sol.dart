class Solution {
  List<int> decode(List<int> encoded, int first) {
    List<int> arr = [first];
    for (int e in encoded) {
      arr.add(arr.last ^ e);
    }
    return arr;
  }
}

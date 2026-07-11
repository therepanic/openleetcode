class Solution {
  List<int> sortedSquares(List<int> nums) {
    List<int> newarr = [];
    for (int i in nums) {
      newarr.add(i * i);
    }
    newarr.sort();
    return newarr;
  }
}

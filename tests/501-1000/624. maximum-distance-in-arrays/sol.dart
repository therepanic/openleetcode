class Solution {
  int maxDistance(List<List<int>> arrays) {
    int smallest = arrays[0][0];
    int largest = arrays[0][arrays[0].length - 1];
    int ans = 0;
    for (int i = 1; i < arrays.length; i++) {
      int curMin = arrays[i][0];
      int curMax = arrays[i][arrays[i].length - 1];
      ans = [ans, largest - curMin, curMax - smallest].reduce((a, b) => a > b ? a : b);
      smallest = curMin < smallest ? curMin : smallest;
      largest = curMax > largest ? curMax : largest;
    }
    return ans;
  }
}

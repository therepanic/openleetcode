class Solution {
  bool canMakeArithmeticProgression(List<int> arr) {
    arr.sort();
    int diff = arr[1] - arr[0];
    for (int i = 0; i < arr.length - 1; i++) {
      if (arr[i+1] - arr[i] != diff) {
        return false;
      }
    }
    return true;
  }
}

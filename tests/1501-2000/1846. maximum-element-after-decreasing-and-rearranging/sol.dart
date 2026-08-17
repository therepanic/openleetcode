class Solution {
  int maximumElementAfterDecrementingAndRearranging(List<int> arr) {
    arr.sort();
    arr[0] = 1;
    for (int i = 1; i < arr.length; i++) {
      arr[i] = arr[i] < arr[i - 1] + 1 ? arr[i] : arr[i - 1] + 1;
    }
    return arr[arr.length - 1];
  }
}

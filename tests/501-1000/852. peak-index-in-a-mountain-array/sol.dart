class Solution {
  int peakIndexInMountainArray(List<int> arr) {
    int l = 0, r = arr.length - 1;
    while (l < r) {
      int mid = (l + r) ~/ 2;
      if (arr[mid] < arr[mid + 1]) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }
    return l;
  }
}

class Solution {
  int findTheDistanceValue(List<int> arr1, List<int> arr2, int d) {
    arr2.sort();
    int count = 0;
    for (int num in arr1) {
      int leftIndex = lowerBound(arr2, num - d);
      int rightIndex = upperBound(arr2, num + d);
      if (leftIndex == rightIndex) {
        count++;
      }
    }
    return count;
  }
  
  int lowerBound(List<int> arr, int target) {
    int left = 0, right = arr.length;
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      if (arr[mid] < target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
  
  int upperBound(List<int> arr, int target) {
    int left = 0, right = arr.length;
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      if (arr[mid] <= target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
}

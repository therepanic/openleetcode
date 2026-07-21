class Solution {
  int findBestValue(List<int> arr, int target) {
    int getMutatedSum(int value) {
      int sum = 0;
      for (int x in arr) {
        sum += x < value ? x : value;
      }
      return sum;
    }
    
    int low = 0;
    int high = arr.reduce((a, b) => a > b ? a : b);
    int result = high;
    int minDiff = 1 << 63 - 1; // MaxInt approximation
    
    while (low <= high) {
      int mid = low + (high - low) ~/ 2;
      int currSum = getMutatedSum(mid);
      int diff = (currSum - target).abs();
      
      if (diff < minDiff || (diff == minDiff && mid < result)) {
        minDiff = diff;
        result = mid;
      }
      
      if (currSum < target) {
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }
    
    return result;
  }
}

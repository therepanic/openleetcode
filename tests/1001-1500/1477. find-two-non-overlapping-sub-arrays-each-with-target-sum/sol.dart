class Solution {
  int minSumOfLengths(List<int> arr, int target) {
    int n = arr.length;
    List<int> bestLeft = List.filled(n, n);
    int minTotal = 1 << 60; // large number
    int left = 0;
    int curr = 0;
    for (int right = 0; right < n; right++) {
      curr += arr[right];
      while (curr > target) {
        curr -= arr[left];
        left++;
      }
      if (curr == target) {
        int length = right - left + 1;
        if (right > 0) {
          bestLeft[right] = bestLeft[right - 1] < length ? bestLeft[right - 1] : length;
        } else {
          bestLeft[right] = length;
        }
        if (left > 0 && bestLeft[left - 1] != n) {
          minTotal = minTotal < bestLeft[left - 1] + length ? minTotal : bestLeft[left - 1] + length;
        }
      } else {
        if (right > 0) {
          bestLeft[right] = bestLeft[right - 1];
        }
      }
    }
    return minTotal == 1 << 60 ? -1 : minTotal;
  }
}

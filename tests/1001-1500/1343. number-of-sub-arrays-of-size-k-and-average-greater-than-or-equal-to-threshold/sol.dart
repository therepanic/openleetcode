class Solution {
  int numOfSubarrays(List<int> arr, int k, int threshold) {
    int res = 0;
    int left = 0;
    int total = 0;
    for (int right = 0; right < arr.length; right++) {
      total += arr[right];
      if (right - left + 1 == k) {
        if (total ~/ k >= threshold) {
          res++;
        }
        total -= arr[left];
        left++;
      }
    }
    return res;
  }
}

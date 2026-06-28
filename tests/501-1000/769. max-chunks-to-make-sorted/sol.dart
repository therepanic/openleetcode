class Solution {
  int maxChunksToSorted(List<int> arr) {
    int ans = 0;
    int prevMax = 0;
    for (int idx = 0; idx < arr.length; idx++) {
      if (arr[idx] > prevMax) {
        prevMax = arr[idx];
      }
      if (prevMax == idx) {
        ans++;
      }
    }
    return ans;
  }
}

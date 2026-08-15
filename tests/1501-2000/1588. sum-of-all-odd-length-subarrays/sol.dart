class Solution {
  int sumOddLengthSubarrays(List<int> arr) {
    int s = arr.reduce((a, b) => a + b);
    int l = arr.length - 1;
    int i = 2;
    while (l >= i) {
      int j = 0;
      int e = i;
      while (e <= l) {
        for (int k = j; k <= e; k++) {
          s += arr[k];
        }
        j++;
        e++;
      }
      i += 2;
    }
    return s;
  }
}

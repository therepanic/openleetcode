class Solution {
  int numOfSubarrays(List<int> arr) {
    int oddCount = 0;
    int prefixSum = 0;
    const int mod = 1000000007;
    for (int a in arr) {
      prefixSum += a;
      oddCount += prefixSum % 2;
    }
    oddCount += (arr.length - oddCount) * oddCount;
    return oddCount % mod;
  }
}

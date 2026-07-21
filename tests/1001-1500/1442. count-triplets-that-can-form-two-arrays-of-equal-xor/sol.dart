class Solution {
  int countTriplets(List<int> arr) {
    int totalCount = 0;
    int prefixXor = 0;
    Map<int, int> prefixCount = {0: 1};
    Map<int, int> indexSum = {0: 0};
    for (int k = 1; k <= arr.length; k++) {
      prefixXor ^= arr[k - 1];
      if (prefixCount.containsKey(prefixXor)) {
        totalCount += prefixCount[prefixXor]! * (k - 1) - indexSum[prefixXor]!;
      } else {
        prefixCount[prefixXor] = 0;
        indexSum[prefixXor] = 0;
      }
      prefixCount[prefixXor] = prefixCount[prefixXor]! + 1;
      indexSum[prefixXor] = indexSum[prefixXor]! + k;
    }
    return totalCount;
  }
}

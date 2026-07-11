class Solution {
  bool canThreePartsEqualSum(List<int> arr) {
    int total = arr.reduce((a, b) => a + b);
    if (total % 3 != 0) {
      return false;
    }
    int target = total ~/ 3;
    int currentSum = 0;
    int partitions = 0;
    for (int i = 0; i < arr.length; i++) {
      currentSum += arr[i];
      if (currentSum == target) {
        partitions++;
        currentSum = 0;
        if (partitions == 2 && i < arr.length - 1) {
          return true;
        }
      }
    }
    return false;
  }
}

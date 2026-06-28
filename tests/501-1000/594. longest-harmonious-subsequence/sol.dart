class Solution {
  int findLHS(List<int> nums) {
    var frequencyMap = <int, int>{};
    for (var num in nums) {
      frequencyMap[num] = (frequencyMap[num] ?? 0) + 1;
    }
    
    int maxLength = 0;
    for (var num in frequencyMap.keys) {
      if (frequencyMap.containsKey(num + 1)) {
        int currentLength = frequencyMap[num]! + frequencyMap[num + 1]!;
        if (currentLength > maxLength) {
          maxLength = currentLength;
        }
      }
    }
    
    return maxLength;
  }
}

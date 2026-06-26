class Solution {
  int subarraySum(List<int> nums, int k) {
    var subNum = {0: 1};
    var total = 0;
    var count = 0;
    
    for (var n in nums) {
      total += n;
      
      if (subNum.containsKey(total - k)) {
        count += subNum[total - k]!;
      }
      
      subNum[total] = (subNum[total] ?? 0) + 1;
    }
    
    return count;
  }
}

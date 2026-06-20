class Solution {
  List<String> summaryRanges(List<int> nums) {
    List<String> result = [];
    int i = 0;
    
    while (i < nums.length) {
      int start = nums[i];
      int j = i;
      while (j + 1 < nums.length && nums[j + 1] == nums[j] + 1) {
        j++;
      }
      
      if (nums[j] == start) {
        result.add(start.toString());
      } else {
        result.add("$start->${nums[j]}");
      }
      
      i = j + 1;
    }
    
    return result;
  }
}

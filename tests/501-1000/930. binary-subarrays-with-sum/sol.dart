class Solution {
  int numSubarraysWithSum(List<int> nums, int goal) {
    int n = nums.length;
    List<int> posOf1s = [-1];
    int total = 0;
    int count = 0;
    
    if (goal == 0) {
      for (int num in nums) {
        if (num == 0) {
          count++;
          total += count;
        } else {
          count = 0;
        }
      }
      return total;
    }
    
    for (int i = 0; i < n; i++) {
      if (nums[i] == 1) {
        posOf1s.add(i);
      }
    }
    posOf1s.add(n);
    
    for (int i = 1; i < posOf1s.length - goal; i++) {
      int leftChoices = posOf1s[i] - posOf1s[i - 1];
      int rightChoices = posOf1s[i + goal] - posOf1s[i + goal - 1];
      total += leftChoices * rightChoices;
    }
    
    return total;
  }
}

class Solution {
  bool canChoose(List<List<int>> groups, List<int> nums) {
    int i = 0;
    for (var group in groups) {
      bool found = false;
      while (i + group.length <= nums.length) {
        bool match = true;
        for (int j = 0; j < group.length; j++) {
          if (nums[i + j] != group[j]) {
            match = false;
            break;
          }
        }
        if (match) {
          i += group.length;
          found = true;
          break;
        } else {
          i++;
        }
      }
      if (!found) return false;
    }
    return true;
  }
}

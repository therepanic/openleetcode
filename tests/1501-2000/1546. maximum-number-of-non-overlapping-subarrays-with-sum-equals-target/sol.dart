class Solution {
  int maxNonOverlapping(List<int> nums, int target) {
    int numOfSubarrays = 0;
    int temp = 0;
    Set<int> visited = {0};
    for (int num in nums) {
      temp += num;
      int prev = temp - target;
      if (visited.contains(prev)) {
        visited = {};
        numOfSubarrays++;
      }
      visited.add(temp);
    }
    return numOfSubarrays;
  }
}

import 'dart:math';

class Solution {
  Map<int, List<int>> map = {};

  Solution(List<int> nums) {
    for (int i = 0; i < nums.length; i++) {
      map.putIfAbsent(nums[i], () => []);
      map[nums[i]]!.add(i);
    }
  }
  
  int pick(int target) {
    final indices = map[target]!;
    return indices[Random().nextInt(indices.length)];
  }
}

class Solution {
  List<List<int>> findSubsequences(List<int> nums) {
    final seen = <String>{};
    final result = <List<int>>[];
    
    void backtrack(int index, List<int> path) {
      if (path.length >= 2) {
        final key = path.join(',');
        if (seen.add(key)) {
          result.add(List<int>.from(path));
        }
      }
      final used = <int>{};
      for (int i = index; i < nums.length; i++) {
        if (used.contains(nums[i])) {
          continue;
        }
        if (path.isEmpty || nums[i] >= path.last) {
          used.add(nums[i]);
          path.add(nums[i]);
          backtrack(i + 1, path);
          path.removeLast();
        }
      }
    }
    
    backtrack(0, []);
    return result.toList();
  }
}

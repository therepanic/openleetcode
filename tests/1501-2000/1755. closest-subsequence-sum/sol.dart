class Solution {
  int minAbsDifference(List<int> nums, int goal) {
    List<int> sums(List<int> values) {
      List<int> result = [0];
      for (int value in values) {
        int currentLen = result.length;
        for (int i = 0; i < currentLen; i++) {
          result.add(result[i] + value);
        }
      }
      return result;
    }

    int mid = nums.length ~/ 2;
    List<int> left = sums(nums.sublist(0, mid))..sort();
    List<int> right = sums(nums.sublist(mid))..sort();
    int answer = goal.abs();
    int j = right.length - 1;
    for (int value in left) {
      while (j > 0 && right[j - 1] >= goal - value) {
        j--;
      }
      answer = [answer, (value + right[j] - goal).abs()].reduce((a, b) => a < b ? a : b);
      if (j > 0) {
        answer = [answer, (value + right[j - 1] - goal).abs()].reduce((a, b) => a < b ? a : b);
      }
    }
    return answer;
  }
}

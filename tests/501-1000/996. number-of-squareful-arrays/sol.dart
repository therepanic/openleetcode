import 'dart:math' as math;

class Solution {
  int numSquarefulPerms(List<int> nums) {
    int n = nums.length;
    nums.sort();

    bool isSquareful(List<int> currNums, int num) {
      if (currNums.isEmpty) return true;
      int prevNum = currNums.last;
      int pairSum = prevNum + num;
      if (pairSum < 0) return false;
      int sqrtN = math.sqrt(pairSum.toDouble()).toInt();
      return sqrtN * sqrtN == pairSum;
    }

    int backtrack(int numsMask, List<int> currNums) {
      if (numsMask != 0 && currNums.length == n) return 1;
      int numSquarefulPerms = 0;
      for (int idx = 0; idx < n; idx++) {
        int num = nums[idx];
        if (idx > 0 && nums[idx] == nums[idx - 1] && (numsMask & (1 << (idx - 1))) == 0) {
          continue;
        }
        if ((numsMask & (1 << idx)) == 0 && isSquareful(currNums, num)) {
          currNums.add(num);
          numSquarefulPerms += backtrack(numsMask | (1 << idx), currNums);
          currNums.removeLast();
        }
      }
      return numSquarefulPerms;
    }

    return backtrack(0, []);
  }
}

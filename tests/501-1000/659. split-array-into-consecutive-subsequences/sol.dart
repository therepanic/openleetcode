class Solution {
  bool isPossible(List<int> nums) {
    Map<int, int> count = {};
    Map<int, int> subseq = {};

    for (int num in nums) {
      count[num] = (count[num] ?? 0) + 1;
    }

    for (int num in nums) {
      if (count[num] == 0) continue;
      if ((subseq[num - 1] ?? 0) > 0) {
        subseq[num - 1] = subseq[num - 1]! - 1;
        subseq[num] = (subseq[num] ?? 0) + 1;
      } else if ((count[num + 1] ?? 0) > 0 && (count[num + 2] ?? 0) > 0) {
        count[num + 1] = count[num + 1]! - 1;
        count[num + 2] = count[num + 2]! - 1;
        subseq[num + 2] = (subseq[num + 2] ?? 0) + 1;
      } else {
        return false;
      }
      count[num] = count[num]! - 1;
    }

    return true;
  }
}

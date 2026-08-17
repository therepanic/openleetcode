class Solution {
  int numOfPairs(List<String> nums, String target) {
    Map<String, int> freq = {};
    for (var num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;
    }

    int totalCnt = 0;

    for (var num in nums) {
      if (target.startsWith(num)) {
        String remain = target.substring(num.length);

        if (remain == num) {
          totalCnt += (freq[remain] ?? 0) - 1;
        } else {
          totalCnt += freq[remain] ?? 0;
        }
      }
    }

    return totalCnt;
  }
}

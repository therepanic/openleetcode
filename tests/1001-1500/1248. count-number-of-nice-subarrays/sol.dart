class Solution {
  int numberOfSubarrays(List<int> nums, int k) {
    var count = {0: 1};
    int odd = 0;
    int answer = 0;
    for (var value in nums) {
      odd += value % 2;
      answer += count[odd - k] ?? 0;
      count[odd] = (count[odd] ?? 0) + 1;
    }
    return answer;
  }
}

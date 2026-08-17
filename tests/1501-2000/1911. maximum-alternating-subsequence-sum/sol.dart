class Solution {
  int maxAlternatingSum(List<int> nums) {
    int even = 0;
    int odd = 0;
    for (final value in nums) {
      final nextEven = even > odd + value ? even : odd + value;
      final nextOdd = odd > even - value ? odd : even - value;
      even = nextEven;
      odd = nextOdd;
    }
    return even;
  }
}

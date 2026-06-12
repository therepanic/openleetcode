class Solution {
  String largestNumber(List<int> nums) {
    final parts = nums.map((num) => num.toString()).toList();
    parts.sort((a, b) => (b + a).compareTo(a + b));
    if (parts.isNotEmpty && parts.first == '0') return '0';
    return parts.join();
  }
}

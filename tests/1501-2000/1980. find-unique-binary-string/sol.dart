class Solution {
  String findDifferentBinaryString(List<String> nums) {
    return nums.asMap().entries.map((e) {
      int i = e.key;
      String s = e.value;
      return s[i] == '0' ? '1' : '0';
    }).join();
  }
}

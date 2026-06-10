class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    int left = 0;
    int right = numbers.length - 1;
    while (left < right) {
      final total = numbers[left] + numbers[right];
      if (total == target) return [left + 1, right + 1];
      if (total < target) {
        left++;
      } else {
        right--;
      }
    }
    return [];
  }
}

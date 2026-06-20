class Solution {
  List<int> nextGreaterElement(List<int> nums1, List<int> nums2) {
    Map<int, int> nextGreater = {};
    List<int> stack = [];
    
    for (int num in nums2.reversed) {
      while (stack.isNotEmpty && stack.last <= num) {
        stack.removeLast();
      }
      nextGreater[num] = stack.isEmpty ? -1 : stack.last;
      stack.add(num);
    }
    
    return nums1.map((num) => nextGreater[num]!).toList();
  }
}

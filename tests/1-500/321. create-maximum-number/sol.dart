class Solution {
  List<int> maxNumber(List<int> nums1, List<int> nums2, int k) {
    List<int> ans = [];
    int m = nums1.length, n = nums2.length;
    int start = (0).compareTo(k - n) > 0 ? 0 : k - n;
    int end = m.compareTo(k) < 0 ? m : k;
    for (int i = start; i <= end; i++) {
      List<int> sub1 = getMaxSubsequence(nums1, i);
      List<int> sub2 = getMaxSubsequence(nums2, k - i);
      List<int> merged = merge(sub1, sub2);
      if (greater(merged, 0, ans, 0)) {
        ans = merged;
      }
    }
    return ans;
  }

  List<int> getMaxSubsequence(List<int> nums, int q) {
    List<int> stack = [];
    int maxDrop = nums.length - q;
    for (int num in nums) {
      while (maxDrop > 0 && stack.isNotEmpty && stack.last < num) {
        stack.removeLast();
        maxDrop--;
      }
      if (stack.length < q) {
        stack.add(num);
      } else {
        maxDrop--;
      }
    }
    return stack;
  }

  List<int> merge(List<int> a, List<int> b) {
    List<int> output = [];
    int i = 0, j = 0;
    while (i < a.length || j < b.length) {
      if (greater(a, i, b, j)) {
        output.add(a[i++]);
      } else {
        output.add(b[j++]);
      }
    }
    return output;
  }

  bool greater(List<int> a, int i, List<int> b, int j) {
    while (i < a.length && j < b.length && a[i] == b[j]) {
      i++;
      j++;
    }
    if (j == b.length) return true;
    if (i < a.length && a[i] > b[j]) return true;
    return false;
  }
}

class Solution {
  List<int> advantageCount(List<int> nums1, List<int> nums2) {
    int n = nums1.length;
    nums1.sort();
    
    List<List<int>> nums2Sorted = List.generate(n, (i) => [nums2[i], i]);
    nums2Sorted.sort((a, b) => a[0].compareTo(b[0]));
    
    List<int> res = List.filled(n, 0);
    int left = 0, right = n - 1;
    for (int i = n - 1; i >= 0; i--) {
      if (nums1[right] > nums2Sorted[i][0]) {
        res[nums2Sorted[i][1]] = nums1[right];
        right--;
      } else {
        res[nums2Sorted[i][1]] = nums1[left];
        left++;
      }
    }
    
    return res;
  }
}

class Solution {
    public int[] advantageCount(int[] nums1, int[] nums2) {
        int n = nums1.length;
        Arrays.sort(nums1);
        
        int[][] nums2Sorted = new int[n][2];
        for (int i = 0; i < n; i++) {
            nums2Sorted[i][0] = nums2[i];
            nums2Sorted[i][1] = i;
        }
        Arrays.sort(nums2Sorted, (a, b) -> Integer.compare(a[0], b[0]));
        
        int[] res = new int[n];
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

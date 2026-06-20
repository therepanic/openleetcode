class Solution {
    public int[] maxNumber(int[] nums1, int[] nums2, int k) {
        int m = nums1.length, n = nums2.length;
        int[] ans = new int[k];
        int start = Math.max(0, k - n);
        int end = Math.min(m, k);
        for (int i = start; i <= end; i++) {
            int[] sub1 = getMaxSubsequence(nums1, i);
            int[] sub2 = getMaxSubsequence(nums2, k - i);
            int[] merged = merge(sub1, sub2);
            if (greater(merged, 0, ans, 0)) {
                ans = merged;
            }
        }
        return ans;
    }

    private int[] getMaxSubsequence(int[] nums, int q) {
        int maxDrop = nums.length - q;
        int[] stack = new int[q];
        int top = -1;
        for (int num : nums) {
            while (maxDrop > 0 && top >= 0 && stack[top] < num) {
                top--;
                maxDrop--;
            }
            if (top + 1 < q) {
                stack[++top] = num;
            } else {
                maxDrop--;
            }
        }
        return stack;
    }

    private int[] merge(int[] a, int[] b) {
        int[] output = new int[a.length + b.length];
        int i = 0, j = 0, k = 0;
        while (i < a.length || j < b.length) {
            if (greater(a, i, b, j)) {
                output[k++] = a[i++];
            } else {
                output[k++] = b[j++];
            }
        }
        return output;
    }

    private boolean greater(int[] a, int i, int[] b, int j) {
        while (i < a.length && j < b.length && a[i] == b[j]) {
            i++;
            j++;
        }
        if (j == b.length) return true;
        if (i < a.length && a[i] > b[j]) return true;
        return false;
    }
}

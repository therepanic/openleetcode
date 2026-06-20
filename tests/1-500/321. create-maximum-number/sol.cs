public class Solution {
    public int[] MaxNumber(int[] nums1, int[] nums2, int k) {
        int[] ans = new int[k];
        int m = nums1.Length, n = nums2.Length;
        int start = Math.Max(0, k - n);
        int end = Math.Min(m, k);
        for (int i = start; i <= end; i++) {
            int[] sub1 = GetMaxSubsequence(nums1, i);
            int[] sub2 = GetMaxSubsequence(nums2, k - i);
            int[] merged = Merge(sub1, sub2);
            if (Greater(merged, 0, ans, 0)) {
                ans = merged;
            }
        }
        return ans;
    }

    private int[] GetMaxSubsequence(int[] nums, int q) {
        int[] stack = new int[q];
        int top = -1;
        int maxDrop = nums.Length - q;
        foreach (int num in nums) {
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

    private int[] Merge(int[] a, int[] b) {
        int[] output = new int[a.Length + b.Length];
        int i = 0, j = 0, idx = 0;
        while (i < a.Length || j < b.Length) {
            if (Greater(a, i, b, j)) {
                output[idx++] = a[i++];
            } else {
                output[idx++] = b[j++];
            }
        }
        return output;
    }

    private bool Greater(int[] a, int i, int[] b, int j) {
        while (i < a.Length && j < b.Length && a[i] == b[j]) {
            i++;
            j++;
        }
        if (j == b.Length) return true;
        if (i < a.Length && a[i] > b[j]) return true;
        return false;
    }
}

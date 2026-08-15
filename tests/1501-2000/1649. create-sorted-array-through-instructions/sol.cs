public class Solution {
    private int[] nums;
    private int[][] ans;
    
    public int CreateSortedArray(int[] instructions) {
        int n = instructions.Length;
        nums = instructions;
        ans = new int[n][];
        for (int i = 0; i < n; i++) ans[i] = new int[2];
        
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = i;
        
        Split(0, n - 1, arr);
        
        long realAns = 0;
        for (int i = 0; i < n; i++) {
            realAns += Math.Min(ans[i][0], ans[i][1]);
        }
        return (int)(realAns % 1000000007);
    }
    
    private int[] Merge(int[] left, int[] right) {
        int l = left.Length - 1;
        int r = right.Length - 1;
        while (l > -1 && r > -1) {
            if (nums[left[l]] <= nums[right[r]]) {
                ans[right[r]][1] += (left.Length - 1) - l;
                r--;
            } else {
                l--;
            }
        }
        while (r > -1) {
            ans[right[r]][1] += left.Length;
            r--;
        }
        
        l = 0;
        r = 0;
        int[] res = new int[left.Length + right.Length];
        int idx = 0;
        while (l < left.Length && r < right.Length) {
            if (nums[left[l]] < nums[right[r]]) {
                res[idx++] = left[l++];
            } else {
                ans[right[r]][0] += l;
                res[idx++] = right[r++];
            }
        }
        while (r < right.Length) {
            ans[right[r]][0] += l;
            res[idx++] = right[r++];
        }
        while (l < left.Length) {
            res[idx++] = left[l++];
        }
        return res;
    }
    
    private int[] Split(int l, int r, int[] arr) {
        if (l == r) {
            return new int[] { arr[r] };
        }
        int mid = (l + r) / 2;
        int[] left = Split(l, mid, arr);
        int[] right = Split(mid + 1, r, arr);
        return Merge(left, right);
    }
}

class Solution {
    private int[] nums;
    private int[][] ans;
    
    public int createSortedArray(int[] instructions) {
        int n = instructions.length;
        this.nums = instructions;
        this.ans = new int[n][2];
        
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = i;
        
        split(0, n - 1, arr);
        
        long realAns = 0;
        for (int i = 0; i < n; i++) {
            realAns += Math.min(ans[i][0], ans[i][1]);
        }
        return (int)(realAns % 1000000007);
    }
    
    private int[] merge(int[] left, int[] right) {
        int l = left.length - 1;
        int r = right.length - 1;
        while (l > -1 && r > -1) {
            if (nums[left[l]] <= nums[right[r]]) {
                ans[right[r]][1] += (left.length - 1) - l;
                r--;
            } else {
                l--;
            }
        }
        while (r > -1) {
            ans[right[r]][1] += left.length;
            r--;
        }
        
        l = 0;
        r = 0;
        int[] res = new int[left.length + right.length];
        int idx = 0;
        while (l < left.length && r < right.length) {
            if (nums[left[l]] < nums[right[r]]) {
                res[idx++] = left[l++];
            } else {
                ans[right[r]][0] += l;
                res[idx++] = right[r++];
            }
        }
        while (r < right.length) {
            ans[right[r]][0] += l;
            res[idx++] = right[r++];
        }
        while (l < left.length) {
            res[idx++] = left[l++];
        }
        return res;
    }
    
    private int[] split(int l, int r, int[] arr) {
        if (l == r) {
            return new int[]{arr[r]};
        }
        int mid = (l + r) / 2;
        int[] left = split(l, mid, arr);
        int[] right = split(mid + 1, r, arr);
        return merge(left, right);
    }
}

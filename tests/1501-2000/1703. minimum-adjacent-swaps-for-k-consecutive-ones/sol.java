class Solution {
    public int minMoves(int[] nums, int k) {
        List<Integer> idx = new ArrayList<>();
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 1) idx.add(i);
        }
        int n = idx.size();
        long[] a = new long[n];
        for (int i = 0; i < n; i++) {
            a[i] = idx.get(i) - i;
        }
        long[] prefix = new long[n];
        if (n > 0) {
            prefix[0] = a[0];
            for (int i = 1; i < n; i++) {
                prefix[i] = prefix[i-1] + a[i];
            }
        }
        long ans = Long.MAX_VALUE;
        int l = 0;
        for (int r = 0; r < n; r++) {
            while (r - l + 1 > k) l++;
            if (r - l + 1 == k) {
                int mid = (l + r) / 2;
                long med = a[mid];
                long leftSum = prefix[mid] - (l > 0 ? prefix[l-1] : 0);
                long rightSum = prefix[r] - prefix[mid];
                long cost = (med * (mid - l + 1) - leftSum) + (rightSum - med * (r - mid));
                ans = Math.min(ans, cost);
            }
        }
        return (int)ans;
    }
}

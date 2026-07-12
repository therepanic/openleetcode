class Solution {
    public int longestArithSeqLength(int[] nums) {
        int n = nums.length;
        if (n <= 2) {
            return n;
        }
        List<Map<Integer, Integer>> dp = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            dp.add(new HashMap<>());
        }
        int ans = 2;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < i; j++) {
                int d = nums[i] - nums[j];
                int prev = dp.get(j).getOrDefault(d, 1);
                Map<Integer, Integer> curr = dp.get(i);
                int candidate = prev + 1;
                if (candidate > curr.getOrDefault(d, 0)) {
                    curr.put(d, candidate);
                }
                ans = Math.max(ans, curr.get(d));
            }
        }
        return ans;
    }
}

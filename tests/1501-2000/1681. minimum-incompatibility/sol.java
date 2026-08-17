class Solution {
    public int minimumIncompatibility(int[] nums, int k) {
        int n = nums.length;
        int sz = n / k;
        
        Map<Integer, Integer> counts = new HashMap<>();
        for (int num : nums) {
            counts.put(num, counts.getOrDefault(num, 0) + 1);
        }
        for (int v : counts.values()) {
            if (v > k) return -1;
        }
        
        Arrays.sort(nums);
        
        Map<Integer, Integer> validSubsets = new HashMap<>();
        for (int mask = 0; mask < (1 << n); mask++) {
            if (Integer.bitCount(mask) == sz) {
                List<Integer> subset = new ArrayList<>();
                for (int i = 0; i < n; i++) {
                    if (((mask >> i) & 1) == 1) {
                        subset.add(nums[i]);
                    }
                }
                Set<Integer> set = new HashSet<>(subset);
                if (set.size() == sz) {
                    int max = Collections.max(subset);
                    int min = Collections.min(subset);
                    validSubsets.put(mask, max - min);
                }
            }
        }
        
        Map<Integer, Integer> memo = new HashMap<>();
        return solve((1 << n) - 1, validSubsets, memo);
    }
    
    private int solve(int remainingMask, Map<Integer, Integer> validSubsets, Map<Integer, Integer> memo) {
        if (remainingMask == 0) return 0;
        if (memo.containsKey(remainingMask)) return memo.get(remainingMask);
        
        int firstElement = Integer.numberOfTrailingZeros(remainingMask & -remainingMask);
        int res = Integer.MAX_VALUE;
        
        for (Map.Entry<Integer, Integer> entry : validSubsets.entrySet()) {
            int mask = entry.getKey();
            int cost = entry.getValue();
            if ((mask & remainingMask) == mask && ((mask >> firstElement) & 1) == 1) {
                int next = solve(remainingMask ^ mask, validSubsets, memo);
                if (next != Integer.MAX_VALUE) {
                    res = Math.min(res, cost + next);
                }
            }
        }
        
        memo.put(remainingMask, res);
        return res;
    }
}

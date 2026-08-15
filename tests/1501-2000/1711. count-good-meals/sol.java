class Solution {
    public int countPairs(int[] deliciousness) {
        final int MOD = 1_000_000_007;
        int maxVal = 0;
        for (int d : deliciousness) maxVal = Math.max(maxVal, d);
        int[] powers = new int[22];
        for (int i = 0; i < 22; i++) powers[i] = 1 << i;
        
        Map<Integer, Integer> count = new HashMap<>();
        long res = 0;
        
        for (int val : deliciousness) {
            for (int target : powers) {
                int complement = target - val;
                if (count.containsKey(complement)) {
                    res += count.get(complement);
                    res %= MOD;
                }
            }
            count.put(val, count.getOrDefault(val, 0) + 1);
        }
        return (int) res;
    }
}

class Solution {
    public int maxHappyGroups(int batchSize, int[] groups) {
        int[] counts = new int[batchSize];
        int happyCount = 0;
        for (int g : groups) {
            int rem = g % batchSize;
            if (rem == 0) {
                happyCount++;
            } else {
                counts[rem]++;
            }
        }
        
        for (int i = 1; i <= batchSize / 2; i++) {
            if (i == batchSize - i) {
                int pairCount = counts[i] / 2;
                happyCount += pairCount;
                counts[i] %= 2;
            } else {
                int pairCount = Math.min(counts[i], counts[batchSize - i]);
                happyCount += pairCount;
                counts[i] -= pairCount;
                counts[batchSize - i] -= pairCount;
            }
        }
        
        int[] state = new int[batchSize - 1];
        for (int i = 0; i < batchSize - 1; i++) {
            state[i] = counts[i + 1];
        }
        
        java.util.Map<String, Integer> memo = new java.util.HashMap<>();
        return happyCount + viterbi(state, 0, batchSize, memo);
    }
    
    private int viterbi(int[] counts, int leftover, int batchSize, java.util.Map<String, Integer> memo) {
        String key = java.util.Arrays.toString(counts) + "," + leftover;
        if (memo.containsKey(key)) return memo.get(key);
        
        int sum = 0;
        for (int c : counts) sum += c;
        if (sum == 0) {
            memo.put(key, 0);
            return 0;
        }
        
        int res = 0;
        for (int i = 0; i < counts.length; i++) {
            if (counts[i] > 0) {
                int rem = i + 1;
                int[] next = counts.clone();
                next[i]--;
                
                int isHappy = (leftover == 0) ? 1 : 0;
                int newLeftover = (leftover + rem) % batchSize;
                
                res = Math.max(res, isHappy + viterbi(next, newLeftover, batchSize, memo));
            }
        }
        memo.put(key, res);
        return res;
    }
}

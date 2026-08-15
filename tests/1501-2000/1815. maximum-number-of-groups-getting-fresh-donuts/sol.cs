public class Solution {
    public int MaxHappyGroups(int batchSize, int[] groups) {
        int[] counts = new int[batchSize];
        int happyCount = 0;
        foreach (int g in groups) {
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
                int pairCount = Math.Min(counts[i], counts[batchSize - i]);
                happyCount += pairCount;
                counts[i] -= pairCount;
                counts[batchSize - i] -= pairCount;
            }
        }
        
        int[] state = new int[batchSize - 1];
        Array.Copy(counts, 1, state, 0, batchSize - 1);
        
        var memo = new Dictionary<string, int>();
        return happyCount + Viterbi(state, 0, batchSize, memo);
    }
    
    private int Viterbi(int[] counts, int leftover, int batchSize, Dictionary<string, int> memo) {
        string key = string.Join(",", counts) + "," + leftover.ToString();
        if (memo.ContainsKey(key)) return memo[key];
        
        int sum = 0;
        foreach (int c in counts) sum += c;
        if (sum == 0) {
            memo[key] = 0;
            return 0;
        }
        
        int res = 0;
        for (int i = 0; i < counts.Length; i++) {
            if (counts[i] > 0) {
                int rem = i + 1;
                int[] next = (int[])counts.Clone();
                next[i]--;
                
                int isHappy = (leftover == 0) ? 1 : 0;
                int newLeftover = (leftover + rem) % batchSize;
                
                int val = isHappy + Viterbi(next, newLeftover, batchSize, memo);
                if (val > res) res = val;
            }
        }
        memo[key] = res;
        return res;
    }
}

public class Solution {
    public int ChalkReplacer(int[] chalk, int k) {
        long total = 0;
        foreach (int amount in chalk) total += amount;
        long remaining = k % total;
        for (int i = 0; i < chalk.Length; i++) {
            if (remaining < chalk[i]) return i;
            remaining -= chalk[i];
        }
        return 0;
    }
}

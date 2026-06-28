class Solution {
    public int leastInterval(char[] tasks, int n) {
        int[] count = new int[26];
        for (char t : tasks) {
            count[t - 'A']++;
        }
        int f_max = 0;
        for (int c : count) {
            f_max = Math.max(f_max, c);
        }
        int max_count = 0;
        for (int c : count) {
            if (c == f_max) max_count++;
        }
        return Math.max(tasks.length, (f_max - 1) * (n + 1) + max_count);
    }
}

public class Solution {
    public int MinPartitions(string n) {
        int max = 0;
        foreach (char c in n) {
            max = Math.Max(max, c - '0');
        }
        return max;
    }
}

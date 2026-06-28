public class Solution {
    public int NumJewelsInStones(string jewels, string stones) {
        int count = 0;
        foreach (char i in jewels) {
            if (stones.Contains(i)) {
                foreach (char s in stones) {
                    if (s == i) count++;
                }
            }
        }
        return count;
    }
}

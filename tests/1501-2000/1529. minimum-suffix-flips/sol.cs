public class Solution {
    public int MinFlips(string target) {
        int minCount = 0;
        int flag = 0;
        int n = target.Length;
        
        for (int i = 0; i < n; i++) {
            char expected = (char)('0' + (flag % 2));
            if (target[i] != expected) {
                minCount++;
                flag++;
            }
        }
        
        return minCount;
    }
}

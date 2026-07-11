public class Solution {
    public int MinFlipsMonoIncr(string s) {
        int zeroes = 0;
        int ones = 0;
        
        foreach (char ch in s) {
            if (ch == '0') {
                zeroes++;
            }
        }
        
        int output = zeroes;
        
        foreach (char ch in s) {
            if (ch == '0') {
                zeroes--;
            } else if (ch == '1') {
                ones++;
            }
            output = Math.Min(output, zeroes + ones);
        }
        
        return output;
    }
}

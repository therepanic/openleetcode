public class Solution {
    public int IntegerBreak(int n) {
        if (n == 2) {
            return 1;
        }
        if (n == 3) {
            return 2;
        }
        
        int threes = n / 3;
        int remainder = n % 3;
        
        if (remainder == 1) {
            threes -= 1;
            remainder = 4;
        } else if (remainder == 0) {
            remainder = 1;
        }
        
        int result = 1;
        for (int i = 0; i < threes; i++) {
            result *= 3;
        }
        return result * remainder;
    }
}

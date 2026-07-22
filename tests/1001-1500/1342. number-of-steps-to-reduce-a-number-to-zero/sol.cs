public class Solution {
    public int NumberOfSteps(int num) {
        if (num == 0) return 0;
        int bitLen = 0;
        int ones = 0;
        int n = num;
        while (n > 0) {
            bitLen++;
            if ((n & 1) == 1) ones++;
            n >>= 1;
        }
        return bitLen - 1 + ones;
    }
}

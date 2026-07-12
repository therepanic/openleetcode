class Solution {
public:
    int bitwiseComplement(int n) {
        if (n == 0) {
            return 1;
        }
        int bitLength = 0;
        int temp = n;
        while (temp > 0) {
            bitLength++;
            temp >>= 1;
        }
        int mask = (1 << bitLength) - 1;
        return n ^ mask;
    }
};

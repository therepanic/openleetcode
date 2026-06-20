class Solution {
public:
    int findComplement(int num) {
        int bit = 1;
        int curr = num;
        while (curr > 0) {
            num ^= bit;
            bit <<= 1;
            curr >>= 1;
        }
        return num;
    }
};

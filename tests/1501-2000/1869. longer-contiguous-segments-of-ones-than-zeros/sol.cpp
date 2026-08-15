class Solution {
public:
    bool checkZeroOnes(string s) {
        int max1 = 0, max0 = 0;
        int one = 0, zero = 0;
        
        for (char ch : s) {
            if (ch == '1') {
                one++;
                zero = 0;
                max1 = max(max1, one);
            } else {
                zero++;
                one = 0;
                max0 = max(max0, zero);
            }
        }
        
        return max1 > max0;
    }
};

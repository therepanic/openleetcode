class Solution {
public:
    string baseNeg2(int n) {
        if (n == 0) return "0";
        string res;
        while (n != 0) {
            int digit = n & 1;
            res.push_back(char('0' + digit));
            n = (n - digit) / -2;
        }
        reverse(res.begin(), res.end());
        return res;
    }
};

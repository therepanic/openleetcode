class Solution {
public:
    string toHex(int num) {
        if (num == 0) return "0";
        unsigned int n = num;
        string h = "0123456789abcdef";
        string r;
        while (n > 0) {
            r += h[n & 15];
            n /= 16;
        }
        reverse(r.begin(), r.end());
        return r;
    }
};

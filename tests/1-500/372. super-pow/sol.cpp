class Solution {
public:
    int superPow(int a, vector<int>& b) {
        a %= 1337;
        int result = 1;
        for (int d : b) {
            result = (powMod(result, 10, 1337) * powMod(a, d, 1337)) % 1337;
        }
        return result;
    }
    
private:
    int powMod(int x, int n, int mod) {
        int res = 1;
        x %= mod;
        while (n > 0) {
            if (n & 1) {
                res = (res * x) % mod;
            }
            x = (x * x) % mod;
            n >>= 1;
        }
        return res;
    }
};

class Solution {
public:
    string getSmallestString(int n, int k) {
        string res(n, 'a');
        k -= n;

        int i = n - 1;
        while (k > 0) {
            int add = min(25, k);
            res[i] = 'a' + add;
            k -= add;
            i--;
        }

        return res;
    }
};

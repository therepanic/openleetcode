class Solution {
public:
    int kthFactor(int n, int k) {
        vector<int> ab;
        for (int i = 1; i <= n; i++) {
            if (n % i == 0) {
                ab.push_back(i);
            }
        }
        if (ab.size() < k) {
            return -1;
        } else {
            return ab[k - 1];
        }
    }
};

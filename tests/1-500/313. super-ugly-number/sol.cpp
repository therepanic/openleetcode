class Solution {
public:
    int nthSuperUglyNumber(int n, vector<int>& primes) {
        vector<int> ugly(n, 1);
        vector<int> idx(primes.size(), 0);
        vector<int> val(primes.begin(), primes.end());
        for (int i = 1; i < n; i++) {
            int m = *min_element(val.begin(), val.end());
            ugly[i] = m;
            for (int j = 0; j < primes.size(); j++) {
                if (val[j] == m) {
                    idx[j]++;
                    val[j] = ugly[idx[j]] * primes[j];
                }
            }
        }
        return ugly[n - 1];
    }
};

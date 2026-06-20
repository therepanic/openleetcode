class Solution {
public:
    int nthSuperUglyNumber(int n, vector<int>& primes) {
        vector<int> ugly(n, 1);
        vector<int> idx(primes.size(), 0);
        vector<long long> val(primes.begin(), primes.end());
        for (int i = 1; i < n; i++) {
            long long m = val[0];
            for (int j = 1; j < (int)val.size(); j++) {
                if (val[j] < m) {
                    m = val[j];
                }
            }
            ugly[i] = (int)m;
            for (int j = 0; j < (int)primes.size(); j++) {
                if (val[j] == m) {
                    idx[j]++;
                    val[j] = 1LL * ugly[idx[j]] * primes[j];
                }
            }
        }
        return ugly[n - 1];
    }
};

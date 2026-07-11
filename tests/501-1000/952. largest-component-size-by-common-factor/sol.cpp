class Solution {
public:
    int largestComponentSize(vector<int>& nums) {
        int n = nums.size();
        vector<int> root(n);
        vector<int> rank(n, 1);
        for (int i = 0; i < n; i++) root[i] = i;

        function<int(int)> find = [&](int x) {
            while (root[x] != x) {
                root[x] = root[root[x]];
                x = root[x];
            }
            return x;
        };

        function<void(int, int)> unionSet = [&](int x, int y) {
            int rx = find(x);
            int ry = find(y);
            if (rx == ry) return;
            if (rank[rx] > rank[ry]) {
                root[ry] = rx;
            } else if (rank[rx] < rank[ry]) {
                root[rx] = ry;
            } else {
                root[ry] = rx;
                rank[rx]++;
            }
        };

        auto getPrimeFactors = [](int n) {
            vector<int> res;
            if (n % 2 == 0) {
                res.push_back(2);
                while (n % 2 == 0) n /= 2;
            }
            for (int i = 3; i * i <= n; i += 2) {
                if (n % i == 0) {
                    res.push_back(i);
                    while (n % i == 0) n /= i;
                }
            }
            if (n > 2) res.push_back(n);
            return res;
        };

        unordered_map<int, int> primeToIdx;
        for (int i = 0; i < n; i++) {
            vector<int> primes = getPrimeFactors(nums[i]);
            for (int p : primes) {
                if (primeToIdx.count(p)) {
                    unionSet(primeToIdx[p], i);
                }
                primeToIdx[p] = i;
            }
        }

        unordered_map<int, int> count;
        int maxSize = 0;
        for (int i = 0; i < n; i++) {
            int r = find(i);
            maxSize = max(maxSize, ++count[r]);
        }
        return maxSize;
    }
};

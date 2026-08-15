class Solution {

public:

    int waysToBuildRooms(vector<int>& prevRoom) {

        int n = prevRoom.size();

        vector<vector<int>> tree(n);

        for (int i = 1; i < n; i++) {

            tree[prevRoom[i]].push_back(i);

        }

        long long MOD = 1e9 + 7;

        vector<long long> fact(n+1), invFact(n+1);

        fact[0] = 1;

        for (int i = 1; i <= n; i++) fact[i] = fact[i-1] * i % MOD;

        invFact[n] = powMod(fact[n], MOD-2, MOD);

        for (int i = n; i > 0; i--) invFact[i-1] = invFact[i] * i % MOD;

        vector<long long> ways(n);

        vector<int> size(n);

        function<void(int)> dfs = [&](int node) {

            ways[node] = 1;

            size[node] = 1;

            for (int child : tree[node]) {

                dfs(child);

                int oldSize = size[node];

                size[node] += size[child];

                ways[node] = ways[node] * comb(size[node]-1, oldSize-1, fact, invFact, MOD) % MOD;

                ways[node] = ways[node] * ways[child] % MOD;

            }

        };

        dfs(0);

        return ways[0];

    }

private:

    long long powMod(long long a, long long b, long long mod) {

        long long res = 1;

        a %= mod;

        while (b > 0) {

            if (b & 1) res = res * a % mod;

            a = a * a % mod;

            b >>= 1;

        }

        return res;

    }

    long long comb(int n, int k, vector<long long>& fact, vector<long long>& invFact, long long mod) {

        if (k < 0 || k > n) return 0;

        return fact[n] * invFact[k] % mod * invFact[n-k] % mod;

    }

};

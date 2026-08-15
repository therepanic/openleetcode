public class Solution {

    public int WaysToBuildRooms(int[] prevRoom) {

        int n = prevRoom.Length;

        var tree = new List<int>[n];

        for (int i = 0; i < n; i++) tree[i] = new List<int>();

        for (int i = 1; i < n; i++) tree[prevRoom[i]].Add(i);

        long MOD = 1_000_000_007;

        long[] fact = new long[n+1];

        long[] invFact = new long[n+1];

        fact[0] = 1;

        for (int i = 1; i <= n; i++) fact[i] = fact[i-1] * i % MOD;

        invFact[n] = PowMod(fact[n], MOD-2, MOD);

        for (int i = n; i > 0; i--) invFact[i-1] = invFact[i] * i % MOD;

        long[] ways = new long[n];

        int[] size = new int[n];

        Dfs(0, tree, ways, size, fact, invFact, MOD);

        return (int)ways[0];

    }

    private void Dfs(int node, List<int>[] tree, long[] ways, int[] size, long[] fact, long[] invFact, long MOD) {

        ways[node] = 1;

        size[node] = 1;

        foreach (int child in tree[node]) {

            Dfs(child, tree, ways, size, fact, invFact, MOD);

            int oldSize = size[node];

            size[node] += size[child];

            ways[node] = ways[node] * Comb(size[node]-1, oldSize-1, fact, invFact, MOD) % MOD;

            ways[node] = ways[node] * ways[child] % MOD;

        }

    }

    private long Comb(int n, int k, long[] fact, long[] invFact, long MOD) {

        if (k < 0 || k > n) return 0;

        return fact[n] * invFact[k] % MOD * invFact[n-k] % MOD;

    }

    private long PowMod(long a, long b, long MOD) {

        long res = 1;

        a %= MOD;

        while (b > 0) {

            if ((b & 1) == 1) res = res * a % MOD;

            a = a * a % MOD;

            b >>= 1;

        }

        return res;

    }

}

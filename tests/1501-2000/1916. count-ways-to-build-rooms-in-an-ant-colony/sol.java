@SuppressWarnings("unchecked")
class Solution {

    public int waysToBuildRooms(int[] prevRoom) {

        int n = prevRoom.length;

        List<Integer>[] tree = new List[n];

        for (int i = 0; i < n; i++) tree[i] = new ArrayList<>();

        for (int i = 1; i < n; i++) tree[prevRoom[i]].add(i);

        long[] fact = new long[n + 1];

        long[] invFact = new long[n + 1];

        int MOD = 1_000_000_007;

        fact[0] = 1;

        for (int i = 1; i <= n; i++) fact[i] = fact[i - 1] * i % MOD;

        invFact[n] = pow(fact[n], MOD - 2, MOD);

        for (int i = n; i > 0; i--) invFact[i - 1] = invFact[i] * i % MOD;

        long[] ways = new long[n];

        int[] size = new int[n];

        dfs(0, tree, ways, size, fact, invFact, MOD);

        return (int) ways[0];

    }

    private void dfs(int node, List<Integer>[] tree, long[] ways, int[] size, long[] fact, long[] invFact, int MOD) {

        ways[node] = 1;

        size[node] = 1;

        for (int child : tree[node]) {

            dfs(child, tree, ways, size, fact, invFact, MOD);

            int oldSize = size[node];

            size[node] += size[child];

            ways[node] = ways[node] * comb(size[node] - 1, oldSize - 1, fact, invFact, MOD) % MOD;

            ways[node] = ways[node] * ways[child] % MOD;

        }

    }

    private long comb(int n, int k, long[] fact, long[] invFact, int MOD) {

        if (k < 0 || k > n) return 0;

        return fact[n] * invFact[k] % MOD * invFact[n - k] % MOD;

    }

    private long pow(long a, long b, int MOD) {

        long res = 1;

        while (b > 0) {

            if ((b & 1) == 1) res = res * a % MOD;

            a = a * a % MOD;

            b >>= 1;

        }

        return res;

    }

}

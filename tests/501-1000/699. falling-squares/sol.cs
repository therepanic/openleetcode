public class Solution {
    private int[] tree;
    private int[] lazy;
    private int n;

    private void BuildTree(int node, int start, int end, int[] arr) {
        if (start == end) {
            tree[node] = arr[start];
            return;
        }
        int mid = (start + end) / 2;
        BuildTree(node * 2 + 1, start, mid, arr);
        BuildTree(node * 2 + 2, mid + 1, end, arr);
        tree[node] = Math.Max(tree[node * 2 + 1], tree[node * 2 + 2]);
    }

    private void UpdateHelper(int node, int start, int end, int left, int right, int val) {
        if (lazy[node] != 0) {
            tree[node] = Math.Max(tree[node], lazy[node]);
            if (start != end) {
                lazy[node * 2 + 1] = lazy[node];
                lazy[node * 2 + 2] = lazy[node];
            }
            lazy[node] = 0;
        }

        if (start > right || end < left || start > end) {
            return;
        }

        if (start >= left && end <= right) {
            tree[node] = val;
            if (start != end) {
                lazy[node * 2 + 1] = val;
                lazy[node * 2 + 2] = val;
            }
            return;
        }

        int mid = (start + end) / 2;
        UpdateHelper(node * 2 + 1, start, mid, left, right, val);
        UpdateHelper(node * 2 + 2, mid + 1, end, left, right, val);
        tree[node] = Math.Max(tree[node * 2 + 1], tree[node * 2 + 2]);
    }

    private int QueryHelper(int node, int start, int end, int left, int right) {
        if (lazy[node] != 0) {
            tree[node] = Math.Max(tree[node], lazy[node]);
            if (start != end) {
                lazy[node * 2 + 1] = lazy[node];
                lazy[node * 2 + 2] = lazy[node];
            }
            lazy[node] = 0;
        }

        if (start >= left && end <= right) {
            return tree[node];
        }

        if (start > right || end < left) {
            return 0;
        }

        int mid = (start + end) / 2;
        return Math.Max(
            QueryHelper(node * 2 + 1, start, mid, left, right),
            QueryHelper(node * 2 + 2, mid + 1, end, left, right)
        );
    }

    private void UpdateRange(int left, int right, int val) {
        UpdateHelper(0, 0, n - 1, left, right, val);
    }

    private int QueryRange(int left, int right) {
        return QueryHelper(0, 0, n - 1, left, right);
    }

    public IList<int> FallingSquares(int[][] positions) {
        List<int> ans = new List<int>();
        HashSet<int> posSet = new HashSet<int>();
        foreach (var p in positions) {
            int l = p[0], side = p[1];
            posSet.Add(l);
            posSet.Add(l + side - 1);
        }
        List<int> pos = posSet.ToList();
        pos.Sort();
        Dictionary<int, int> mp = new Dictionary<int, int>();
        for (int i = 0; i < pos.Count; i++) {
            mp[pos[i]] = i;
        }
        n = pos.Count;
        int[] arr = new int[n];
        tree = new int[4 * n];
        lazy = new int[4 * n];
        if (n > 0) {
            BuildTree(0, 0, n - 1, arr);
        }
        foreach (var p in positions) {
            int l = p[0], side = p[1];
            int left = mp[l];
            int right = mp[l + side - 1];
            int mx = QueryRange(left, right);
            UpdateRange(left, right, mx + side);
            ans.Add(QueryRange(0, n - 1));
        }
        return ans;
    }
}

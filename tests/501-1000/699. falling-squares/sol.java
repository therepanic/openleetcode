class Solution {
    private int[] tree;
    private int[] lazy;
    private int n;

    private void buildTree(int node, int start, int end, int[] arr) {
        if (start == end) {
            tree[node] = arr[start];
            return;
        }
        int mid = (start + end) / 2;
        buildTree(node * 2 + 1, start, mid, arr);
        buildTree(node * 2 + 2, mid + 1, end, arr);
        tree[node] = Math.max(tree[node * 2 + 1], tree[node * 2 + 2]);
    }

    private void updateHelper(int node, int start, int end, int left, int right, int val) {
        if (lazy[node] != 0) {
            tree[node] = Math.max(tree[node], lazy[node]);
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
        updateHelper(node * 2 + 1, start, mid, left, right, val);
        updateHelper(node * 2 + 2, mid + 1, end, left, right, val);
        tree[node] = Math.max(tree[node * 2 + 1], tree[node * 2 + 2]);
    }

    private int queryHelper(int node, int start, int end, int left, int right) {
        if (lazy[node] != 0) {
            tree[node] = Math.max(tree[node], lazy[node]);
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
        return Math.max(
            queryHelper(node * 2 + 1, start, mid, left, right),
            queryHelper(node * 2 + 2, mid + 1, end, left, right)
        );
    }

    private void updateRange(int left, int right, int val) {
        updateHelper(0, 0, n - 1, left, right, val);
    }

    private int query(int left, int right) {
        return queryHelper(0, 0, n - 1, left, right);
    }

    public List<Integer> fallingSquares(int[][] positions) {
        List<Integer> ans = new ArrayList<>();
        Set<Integer> posSet = new HashSet<>();
        for (int[] p : positions) {
            int l = p[0], side = p[1];
            posSet.add(l);
            posSet.add(l + side - 1);
        }
        List<Integer> posList = new ArrayList<>(posSet);
        Collections.sort(posList);
        Map<Integer, Integer> mp = new HashMap<>();
        for (int i = 0; i < posList.size(); i++) {
            mp.put(posList.get(i), i);
        }
        n = posList.size();
        int[] arr = new int[n];
        tree = new int[4 * n];
        lazy = new int[4 * n];
        if (n > 0) {
            buildTree(0, 0, n - 1, arr);
        }
        for (int[] p : positions) {
            int l = p[0], side = p[1];
            int left = mp.get(l);
            int right = mp.get(l + side - 1);
            int mx = query(left, right);
            updateRange(left, right, mx + side);
            ans.add(query(0, n - 1));
        }
        return ans;
    }
}

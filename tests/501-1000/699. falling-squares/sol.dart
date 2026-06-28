class Solution {
  List<int> fallingSquares(List<List<int>> positions) {
    List<int> ans = [];
    Set<int> posSet = {};
    for (var p in positions) {
      int l = p[0], side = p[1];
      posSet.add(l);
      posSet.add(l + side - 1);
    }
    List<int> pos = posSet.toList()..sort();
    Map<int, int> mp = {};
    for (int i = 0; i < pos.length; i++) {
      mp[pos[i]] = i;
    }
    int n = pos.length;
    List<int> arr = List.filled(n, 0);
    List<int> tree = List.filled(4 * n, 0);
    List<int> lazy = List.filled(4 * n, 0);

    void buildTree(int node, int start, int end) {
      if (start == end) {
        tree[node] = arr[start];
        return;
      }
      int mid = (start + end) ~/ 2;
      buildTree(node * 2 + 1, start, mid);
      buildTree(node * 2 + 2, mid + 1, end);
      tree[node] = max(tree[node * 2 + 1], tree[node * 2 + 2]);
    }

    void updateHelper(int node, int start, int end, int left, int right, int val) {
      if (lazy[node] != 0) {
        tree[node] = max(tree[node], lazy[node]);
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

      int mid = (start + end) ~/ 2;
      updateHelper(node * 2 + 1, start, mid, left, right, val);
      updateHelper(node * 2 + 2, mid + 1, end, left, right, val);
      tree[node] = max(tree[node * 2 + 1], tree[node * 2 + 2]);
    }

    int queryHelper(int node, int start, int end, int left, int right) {
      if (lazy[node] != 0) {
        tree[node] = max(tree[node], lazy[node]);
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

      int mid = (start + end) ~/ 2;
      return max(
        queryHelper(node * 2 + 1, start, mid, left, right),
        queryHelper(node * 2 + 2, mid + 1, end, left, right),
      );
    }

    void updateRange(int left, int right, int val) {
      updateHelper(0, 0, n - 1, left, right, val);
    }

    int query(int left, int right) {
      return queryHelper(0, 0, n - 1, left, right);
    }

    if (n > 0) {
      buildTree(0, 0, n - 1);
    }

    for (var p in positions) {
      int l = p[0], side = p[1];
      int left = mp[l]!;
      int right = mp[l + side - 1]!;
      int mx = query(left, right);
      updateRange(left, right, mx + side);
      ans.add(query(0, n - 1));
    }
    return ans;
  }
}

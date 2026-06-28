class Solution {
private:
    vector<int> tree;
    vector<int> lazy;
    int n;

    void buildTree(int node, int start, int end, const vector<int>& arr) {
        if (start == end) {
            tree[node] = arr[start];
            return;
        }
        int mid = (start + end) / 2;
        buildTree(node * 2 + 1, start, mid, arr);
        buildTree(node * 2 + 2, mid + 1, end, arr);
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

        int mid = (start + end) / 2;
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

        int mid = (start + end) / 2;
        return max(
            queryHelper(node * 2 + 1, start, mid, left, right),
            queryHelper(node * 2 + 2, mid + 1, end, left, right)
        );
    }

    void updateRange(int left, int right, int val) {
        updateHelper(0, 0, n - 1, left, right, val);
    }

    int queryRange(int left, int right) {
        return queryHelper(0, 0, n - 1, left, right);
    }

public:
    vector<int> fallingSquares(vector<vector<int>>& positions) {
        vector<int> ans;
        set<int> posSet;
        for (auto& p : positions) {
            int l = p[0], side = p[1];
            posSet.insert(l);
            posSet.insert(l + side - 1);
        }
        vector<int> pos(posSet.begin(), posSet.end());
        sort(pos.begin(), pos.end());
        unordered_map<int, int> mp;
        for (int i = 0; i < pos.size(); i++) {
            mp[pos[i]] = i;
        }
        n = pos.size();
        vector<int> arr(n, 0);
        tree.assign(4 * n, 0);
        lazy.assign(4 * n, 0);
        if (n > 0) {
            buildTree(0, 0, n - 1, arr);
        }
        for (auto& p : positions) {
            int l = p[0], side = p[1];
            int left = mp[l];
            int right = mp[l + side - 1];
            int mx = queryRange(left, right);
            updateRange(left, right, mx + side);
            ans.push_back(queryRange(0, n - 1));
        }
        return ans;
    }
};

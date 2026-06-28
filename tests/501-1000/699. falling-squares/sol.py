from math import inf


class LazySegmentTree:
    def __init__(self, arr):
        self.arr = arr
        self.arr_size = len(arr)
        self.size = 4 * self.arr_size
        self.tree = [0] * self.size
        self.lazy = [0] * self.size
        self.build_tree(0, 0, self.arr_size - 1)

    def left_child(self, node):
        return 2 * node + 1

    def right_child(self, node):
        return 2 * node + 2

    def build_tree(self, node, start, end):
        if start == end:
            self.tree[node] = self.arr[start]
            return self.tree[node]
        mid = (start + end) // 2
        self.tree[node] = max(
            self.build_tree(self.left_child(node), start, mid),
            self.build_tree(self.right_child(node), mid + 1, end),
        )
        return self.tree[node]

    def update_diff(self, index, diff):
        self.update_helper(0, 0, self.arr_size - 1, index, index, diff)

    def update_range(self, left, right, value):
        self.update_helper(0, 0, self.arr_size - 1, left, right, value)

    def update_helper(self, node, start, end, left, right, diff):
        # Handle lazy propagation
        if self.lazy[node] != 0:
            self.tree[node] = max(self.tree[node], self.lazy[node])
            if start != end:
                self.lazy[self.left_child(node)] = self.lazy[node]
                self.lazy[self.right_child(node)] = self.lazy[node]
            self.lazy[node] = 0

        if start > right or end < left or start > end:
            return

        if start >= left and end <= right:
            self.tree[node] = diff
            if start != end:
                self.lazy[self.left_child(node)] = diff
                self.lazy[self.right_child(node)] = diff
            return

        mid = (start + end) // 2
        self.update_helper(self.left_child(node), start, mid, left, right, diff)
        self.update_helper(self.right_child(node), mid + 1, end, left, right, diff)
        self.tree[node] = max(
            self.tree[self.left_child(node)], self.tree[self.right_child(node)]
        )

    def query(self, left, right):
        return self.query_helper(0, 0, self.arr_size - 1, left, right)

    def query_helper(self, node, start, end, left, right):
        if self.lazy[node] != 0:
            self.tree[node] = max(self.tree[node], self.lazy[node])
            if start != end:
                self.lazy[self.left_child(node)] = self.lazy[node]
                self.lazy[self.right_child(node)] = self.lazy[node]
            self.lazy[node] = 0
        if start >= left and end <= right:
            return self.tree[node]

        if start > right or end < left:
            return 0

        mid = (start + end) // 2
        return max(
            self.query_helper(self.left_child(node), start, mid, left, right),
            self.query_helper(self.right_child(node), mid + 1, end, left, right),
        )


class Solution:
    def fallingSquares(self, positions):
        ans = []
        pos = set()
        for l, side in positions:
            pos.add(l)
            pos.add(l + side - 1)
        pos = sorted(list(pos))
        mp = {}
        for i, j in enumerate(pos):
            mp[j] = i
        n = len(pos)
        st = LazySegmentTree([0] * n)
        for l, side in positions:
            left, right = mp[l], mp[l + side - 1]
            mx = st.query(left, right)
            st.update_range(left, right, mx + side)
            ans.append(st.query(0, n - 1))
        return ans


# S = Solution()
# print(S.fallingSquares([[1, 2], [2, 3], [6, 1]]))
# print(S.fallingSquares([[100, 100], [200, 100]]))

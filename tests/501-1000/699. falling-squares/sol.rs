impl Solution {
    pub fn falling_squares(positions: Vec<Vec<i32>>) -> Vec<i32> {
        let mut ans = Vec::new();
        let mut pos_set = std::collections::HashSet::new();
        for p in &positions {
            let l = p[0];
            let side = p[1];
            pos_set.insert(l);
            pos_set.insert(l + side - 1);
        }
        let mut pos: Vec<i32> = pos_set.into_iter().collect();
        pos.sort();
        let mut mp = std::collections::HashMap::new();
        for (i, &v) in pos.iter().enumerate() {
            mp.insert(v, i);
        }
        let n = pos.len();
        let arr = vec![0; n];
        let mut tree = vec![0; 4 * n];
        let mut lazy = vec![0; 4 * n];

        fn build_tree(node: usize, start: usize, end: usize, arr: &[i32], tree: &mut [i32]) {
            if start == end {
                tree[node] = arr[start];
                return;
            }
            let mid = (start + end) / 2;
            build_tree(node * 2 + 1, start, mid, arr, tree);
            build_tree(node * 2 + 2, mid + 1, end, arr, tree);
            tree[node] = tree[node * 2 + 1].max(tree[node * 2 + 2]);
        }

        fn update_helper(
            node: usize,
            start: usize,
            end: usize,
            left: usize,
            right: usize,
            val: i32,
            tree: &mut [i32],
            lazy: &mut [i32],
        ) {
            if lazy[node] != 0 {
                tree[node] = tree[node].max(lazy[node]);
                if start != end {
                    lazy[node * 2 + 1] = lazy[node];
                    lazy[node * 2 + 2] = lazy[node];
                }
                lazy[node] = 0;
            }

            if start > right || end < left || start > end {
                return;
            }

            if start >= left && end <= right {
                tree[node] = val;
                if start != end {
                    lazy[node * 2 + 1] = val;
                    lazy[node * 2 + 2] = val;
                }
                return;
            }

            let mid = (start + end) / 2;
            update_helper(node * 2 + 1, start, mid, left, right, val, tree, lazy);
            update_helper(node * 2 + 2, mid + 1, end, left, right, val, tree, lazy);
            tree[node] = tree[node * 2 + 1].max(tree[node * 2 + 2]);
        }

        fn query_helper(
            node: usize,
            start: usize,
            end: usize,
            left: usize,
            right: usize,
            tree: &mut [i32],
            lazy: &mut [i32],
        ) -> i32 {
            if lazy[node] != 0 {
                tree[node] = tree[node].max(lazy[node]);
                if start != end {
                    lazy[node * 2 + 1] = lazy[node];
                    lazy[node * 2 + 2] = lazy[node];
                }
                lazy[node] = 0;
            }

            if start >= left && end <= right {
                return tree[node];
            }

            if start > right || end < left {
                return 0;
            }

            let mid = (start + end) / 2;
            let left_max = query_helper(node * 2 + 1, start, mid, left, right, tree, lazy);
            let right_max = query_helper(node * 2 + 2, mid + 1, end, left, right, tree, lazy);
            left_max.max(right_max)
        }

        fn update_range(
            left: usize,
            right: usize,
            val: i32,
            n: usize,
            tree: &mut [i32],
            lazy: &mut [i32],
        ) {
            update_helper(0, 0, n - 1, left, right, val, tree, lazy);
        }

        fn query_range(
            left: usize,
            right: usize,
            n: usize,
            tree: &mut [i32],
            lazy: &mut [i32],
        ) -> i32 {
            query_helper(0, 0, n - 1, left, right, tree, lazy)
        }

        if n > 0 {
            build_tree(0, 0, n - 1, &arr, &mut tree);
        }

        for p in &positions {
            let l = p[0];
            let side = p[1];
            let left = *mp.get(&l).unwrap();
            let right = *mp.get(&(l + side - 1)).unwrap();
            let mx = query_range(left, right, n, &mut tree, &mut lazy);
            update_range(left, right, mx + side, n, &mut tree, &mut lazy);
            ans.push(query_range(0, n - 1, n, &mut tree, &mut lazy));
        }

        ans
    }
}

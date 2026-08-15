class Solution {
    public boolean gcdSort(int[] nums) {
        class UnionFind {
            int[] parent;
            int[] size;
            UnionFind(int n) {
                parent = new int[n];
                size = new int[n];
                for (int i = 0; i < n; i++) {
                    parent[i] = i;
                    size[i] = 1;
                }
            }
            int find(int x) {
                if (parent[x] != x) {
                    parent[x] = find(parent[x]);
                }
                return parent[x];
            }
            boolean connected(int x, int y) {
                return find(x) == find(y);
            }
            void union(int x, int y) {
                int px = find(x);
                int py = find(y);
                if (px != py) {
                    if (size[px] < size[py]) {
                        parent[px] = py;
                        size[py] += size[px];
                    } else {
                        parent[py] = px;
                        size[px] += size[py];
                    }
                }
            }
        }

        int maxVal = 0;
        for (int num : nums) {
            maxVal = Math.max(maxVal, num);
        }
        UnionFind uf = new UnionFind(maxVal + 1);
        for (int num : nums) {
            int n = num;
            int i = 2;
            while (i * i <= n) {
                if (n % i == 0) {
                    uf.union(i, num);
                    while (n % i == 0) {
                        n /= i;
                    }
                }
                i++;
            }
            if (n > 1) {
                uf.union(n, num);
            }
        }
        int[] sorted = nums.clone();
        java.util.Arrays.sort(sorted);
        for (int i = 0; i < nums.length; i++) {
            if (!uf.connected(nums[i], sorted[i])) {
                return false;
            }
        }
        return true;
    }
}

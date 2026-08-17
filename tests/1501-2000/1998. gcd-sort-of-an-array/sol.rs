impl Solution {
    pub fn gcd_sort(nums: Vec<i32>) -> bool {
        struct UnionFind {
            parent: Vec<usize>,
            size: Vec<usize>,
        }
        impl UnionFind {
            fn new(n: usize) -> Self {
                UnionFind {
                    parent: (0..n).collect(),
                    size: vec![1; n],
                }
            }
            fn find(&mut self, x: usize) -> usize {
                if self.parent[x] != x {
                    let root = self.find(self.parent[x]);
                    self.parent[x] = root;
                }
                self.parent[x]
            }
            fn union(&mut self, x: usize, y: usize) {
                let px = self.find(x);
                let py = self.find(y);
                if px != py {
                    if self.size[px] < self.size[py] {
                        self.parent[px] = py;
                        self.size[py] += self.size[px];
                    } else {
                        self.parent[py] = px;
                        self.size[px] += self.size[py];
                    }
                }
            }
            fn connected(&mut self, x: usize, y: usize) -> bool {
                self.find(x) == self.find(y)
            }
        }

        let max_val = *nums.iter().max().unwrap_or(&0) as usize;
        let mut uf = UnionFind::new(max_val + 1);
        for &num in nums.iter() {
            let mut n = num as usize;
            let mut i = 2;
            while i * i <= n {
                if n % i == 0 {
                    uf.union(i, num as usize);
                    while n % i == 0 {
                        n /= i;
                    }
                }
                i += 1;
            }
            if n > 1 {
                uf.union(n, num as usize);
            }
        }
        let mut sorted = nums.clone();
        sorted.sort_unstable();
        for i in 0..nums.len() {
            if !uf.connected(nums[i] as usize, sorted[i] as usize) {
                return false;
            }
        }
        true
    }
}

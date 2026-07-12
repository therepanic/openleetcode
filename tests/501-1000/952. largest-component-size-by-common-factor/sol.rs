impl Solution {
    pub fn largest_component_size(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        let mut root: Vec<usize> = (0..n).collect();
        let mut rank = vec![1usize; n];

        fn find(root: &mut Vec<usize>, x: usize) -> usize {
            let mut cur = x;
            while root[cur] != cur {
                root[cur] = root[root[cur]];
                cur = root[cur];
            }
            cur
        }

        fn union(root: &mut Vec<usize>, rank: &mut Vec<usize>, x: usize, y: usize) {
            let rx = find(root, x);
            let ry = find(root, y);
            if rx == ry {
                return;
            }
            if rank[rx] > rank[ry] {
                root[ry] = rx;
            } else if rank[rx] < rank[ry] {
                root[rx] = ry;
            } else {
                root[ry] = rx;
                rank[rx] += 1;
            }
        }

        fn get_prime_factors(mut n: i32) -> Vec<i32> {
            let mut res = Vec::new();
            if n % 2 == 0 {
                res.push(2);
                while n % 2 == 0 {
                    n /= 2;
                }
            }
            let mut i = 3;
            while i * i <= n {
                if n % i == 0 {
                    res.push(i);
                    while n % i == 0 {
                        n /= i;
                    }
                }
                i += 2;
            }
            if n > 2 {
                res.push(n);
            }
            res
        }

        use std::collections::HashMap;
        let mut prime_to_idx: HashMap<i32, usize> = HashMap::new();

        for (i, &num) in nums.iter().enumerate() {
            let primes = get_prime_factors(num);
            for p in primes {
                if let Some(&prev) = prime_to_idx.get(&p) {
                    union(&mut root, &mut rank, prev, i);
                }
                prime_to_idx.insert(p, i);
            }
        }

        let mut count: HashMap<usize, i32> = HashMap::new();
        let mut max_size = 0;
        for i in 0..n {
            let r = find(&mut root, i);
            let c = count.entry(r).or_insert(0);
            *c += 1;
            if *c > max_size {
                max_size = *c;
            }
        }
        max_size
    }
}

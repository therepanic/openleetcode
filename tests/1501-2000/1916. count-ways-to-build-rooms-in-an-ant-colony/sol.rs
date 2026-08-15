impl Solution {

    pub fn ways_to_build_rooms(prev_room: Vec<i32>) -> i32 {

        let n = prev_room.len();

        let mut tree = vec![vec![]; n];

        for i in 1..n {

            tree[prev_room[i] as usize].push(i);

        }

        let mod_val = 1_000_000_007i64;

        let mut fact = vec![1i64; n+1];

        let mut inv_fact = vec![1i64; n+1];

        for i in 1..=n {

            fact[i] = fact[i-1] * i as i64 % mod_val;

        }

        inv_fact[n] = Self::pow_mod(fact[n], mod_val - 2, mod_val);

        for i in (1..=n).rev() {

            inv_fact[i-1] = inv_fact[i] * i as i64 % mod_val;

        }

        let mut ways = vec![0i64; n];

        let mut size = vec![0usize; n];

        Self::dfs(0, &tree, &mut ways, &mut size, &fact, &inv_fact, mod_val);

        ways[0] as i32

    }

    fn dfs(node: usize, tree: &Vec<Vec<usize>>, ways: &mut Vec<i64>, size: &mut Vec<usize>, fact: &Vec<i64>, inv_fact: &Vec<i64>, mod_val: i64) {

        ways[node] = 1;

        size[node] = 1;

        for &child in &tree[node] {

            Self::dfs(child, tree, ways, size, fact, inv_fact, mod_val);

            let old_size = size[node];

            size[node] += size[child];

            ways[node] = ways[node] * Self::comb(size[node] as i64 - 1, (old_size-1) as i64, fact, inv_fact, mod_val) % mod_val;

            ways[node] = ways[node] * ways[child] % mod_val;

        }

    }

    fn comb(n: i64, k: i64, fact: &Vec<i64>, inv_fact: &Vec<i64>, mod_val: i64) -> i64 {

        if k < 0 || k > n { return 0; }

        fact[n as usize] * inv_fact[k as usize] % mod_val * inv_fact[(n-k) as usize] % mod_val

    }

    fn pow_mod(mut a: i64, mut b: i64, mod_val: i64) -> i64 {

        let mut res = 1i64;

        a %= mod_val;

        while b > 0 {

            if b & 1 == 1 {

                res = res * a % mod_val;

            }

            a = a * a % mod_val;

            b >>= 1;

        }

        res

    }

}

impl Solution {
    pub fn are_connected(n: i32, threshold: i32, queries: Vec<Vec<i32>>) -> Vec<bool> {
        let limit = queries.iter().fold(n, |acc, q| acc.max(q[0]).max(q[1])) as usize;
        let mut parent: Vec<usize> = (0..=limit).collect();
        let mut rank: Vec<usize> = vec![1; limit + 1];

        fn find(parent: &mut Vec<usize>, x: usize) -> usize {
            let mut res = x;
            while res != parent[res] {
                parent[res] = parent[parent[res]];
                res = parent[res];
            }
            res
        }

        fn union(parent: &mut Vec<usize>, rank: &mut Vec<usize>, a: usize, b: usize) -> bool {
            let p1 = find(parent, a);
            let p2 = find(parent, b);
            if p1 == p2 {
                return false;
            }
            if rank[p1] > rank[p2] {
                parent[p2] = p1;
                rank[p1] += rank[p2];
            } else {
                parent[p1] = p2;
                rank[p2] += rank[p1];
            }
            true
        }

        for i in (threshold as usize + 1)..=limit {
            let mut j = 2 * i;
            while j <= limit {
                union(&mut parent, &mut rank, i, j);
                j += i;
            }
        }

        queries.iter().map(|q| {
            let x = q[0] as usize;
            let y = q[1] as usize;
            find(&mut parent, x) == find(&mut parent, y)
        }).collect()
    }
}

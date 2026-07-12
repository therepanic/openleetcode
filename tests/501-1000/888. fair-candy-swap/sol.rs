impl Solution {
    pub fn fair_candy_swap(alice_sizes: Vec<i32>, bob_sizes: Vec<i32>) -> Vec<i32> {
        let sum_a: i32 = alice_sizes.iter().sum();
        let sum_b: i32 = bob_sizes.iter().sum();
        let diff = (sum_b - sum_a) / 2;
        let set_b: std::collections::HashSet<i32> = bob_sizes.into_iter().collect();
        for &a in &alice_sizes {
            if set_b.contains(&(a + diff)) {
                return vec![a, a + diff];
            }
        }
        vec![]
    }
}

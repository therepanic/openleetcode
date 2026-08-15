impl Solution {
    pub fn tuple_same_product(nums: Vec<i32>) -> i32 {
        use std::collections::HashMap;
        let mut product_count: HashMap<i32, i32> = HashMap::new();
        let mut ans = 0;

        for i in 0..nums.len() {
            for j in (i+1)..nums.len() {
                let product = nums[i] * nums[j];
                let count = *product_count.get(&product).unwrap_or(&0);
                ans += 8 * count;
                *product_count.entry(product).or_insert(0) += 1;
            }
        }

        ans
    }
}

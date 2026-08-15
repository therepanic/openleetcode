impl Solution {

    pub fn max_product_difference(nums: Vec<i32>) -> i32 {

        let mut n = nums.clone();
        n.sort();
        let len = n.len();
        (n[len-1] * n[len-2]) - (n[0] * n[1])

    }

}

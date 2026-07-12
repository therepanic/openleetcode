impl Solution {
    pub fn sorted_squares(nums: Vec<i32>) -> Vec<i32> {
        let mut newarr: Vec<i32> = Vec::new();
        for i in nums {
            newarr.push(i * i);
        }
        newarr.sort();
        newarr
    }
}

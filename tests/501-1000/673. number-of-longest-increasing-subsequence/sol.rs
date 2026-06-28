impl Solution {
    pub fn find_number_of_lis(nums: Vec<i32>) -> i32 {
        let n = nums.len();
        if n == 0 {
            return 0;
        }

        let mut lengths = vec![1; n];
        let mut counts = vec![1; n];

        for i in 0..n {
            for j in 0..i {
                if nums[j] < nums[i] {
                    if lengths[j] + 1 > lengths[i] {
                        lengths[i] = lengths[j] + 1;
                        counts[i] = counts[j];
                    } else if lengths[j] + 1 == lengths[i] {
                        counts[i] += counts[j];
                    }
                }
            }
        }

        let max_length = *lengths.iter().max().unwrap();
        let mut result = 0;
        for i in 0..n {
            if lengths[i] == max_length {
                result += counts[i];
            }
        }
        result
    }
}

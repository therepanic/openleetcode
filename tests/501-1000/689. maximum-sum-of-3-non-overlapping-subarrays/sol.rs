impl Solution {
    pub fn max_sum_of_three_subarrays(nums: Vec<i32>, k: i32) -> Vec<i32> {
        let n = nums.len();
        let k = k as usize;
        let mut sum1: i32 = nums[0..k].iter().sum();
        let mut sum2: i32 = nums[k..2*k].iter().sum();
        let mut sum3: i32 = nums[2*k..3*k].iter().sum();

        let mut max1 = sum1;
        let mut max12 = sum1 + sum2;
        let mut max123 = sum1 + sum2 + sum3;

        let mut index1 = 0;
        let mut index12_1 = 0;
        let mut index12_2 = k;
        let mut ans = vec![0, k as i32, 2 * k as i32];

        for i in 1..=n - 3 * k {
            sum1 = sum1 - nums[i - 1] + nums[i + k - 1];
            sum2 = sum2 - nums[i + k - 1] + nums[i + 2 * k - 1];
            sum3 = sum3 - nums[i + 2 * k - 1] + nums[i + 3 * k - 1];

            if sum1 > max1 {
                max1 = sum1;
                index1 = i;
            }

            if max1 + sum2 > max12 {
                max12 = max1 + sum2;
                index12_1 = index1;
                index12_2 = i + k;
            }

            if max12 + sum3 > max123 {
                max123 = max12 + sum3;
                ans = vec![index12_1 as i32, index12_2 as i32, (i + 2 * k) as i32];
            }
        }

        ans
    }
}

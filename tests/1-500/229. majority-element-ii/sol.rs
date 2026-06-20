impl Solution {
    pub fn majority_element(nums: Vec<i32>) -> Vec<i32> {
        let mut majority1 = 0;
        let mut majority2 = 0;
        let mut count1 = 0;
        let mut count2 = 0;

        for &num in &nums {
            if num == majority1 {
                count1 += 1;
            } else if num == majority2 {
                count2 += 1;
            } else if count1 == 0 {
                majority1 = num;
                count1 = 1;
            } else if count2 == 0 {
                majority2 = num;
                count2 = 1;
            } else {
                count1 -= 1;
                count2 -= 1;
            }
        }

        count1 = 0;
        count2 = 0;

        for &num in &nums {
            if num == majority1 {
                count1 += 1;
            } else if num == majority2 {
                count2 += 1;
            }
        }

        let mut res = Vec::new();
        if count1 > nums.len() / 3 {
            res.push(majority1);
        }
        if count2 > nums.len() / 3 {
            res.push(majority2);
        }

        res
    }
}

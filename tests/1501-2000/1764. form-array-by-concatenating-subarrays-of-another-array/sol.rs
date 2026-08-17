impl Solution {
    pub fn can_choose(groups: Vec<Vec<i32>>, nums: Vec<i32>) -> bool {
        let mut i = 0;
        for group in groups {
            let mut found = false;
            while i + group.len() <= nums.len() {
                let mut match_all = true;
                for j in 0..group.len() {
                    if nums[i + j] != group[j] {
                        match_all = false;
                        break;
                    }
                }
                if match_all {
                    i += group.len();
                    found = true;
                    break;
                } else {
                    i += 1;
                }
            }
            if !found {
                return false;
            }
        }
        true
    }
}

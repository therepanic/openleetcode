impl Solution {
    pub fn array_pair_sum(nums: Vec<i32>) -> i32 {
        let mut bucket = vec![0; 20001];
        for x in nums {
            bucket[(x + 10000) as usize] += 1;
        }
        let mut res = 0;
        let mut flag = true;
        for i in 0..20001 {
            while bucket[i] > 0 {
                if flag {
                    res += i as i32 - 10000;
                }
                flag = !flag;
                bucket[i] -= 1;
            }
        }
        res
    }
}

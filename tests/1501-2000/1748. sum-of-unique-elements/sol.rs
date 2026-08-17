impl Solution {
    pub fn sum_of_unique(nums: Vec<i32>) -> i32 {
        let mut s=0;
        for &i in &nums{
            if nums.iter().filter(|&&x| x==i).count()==1{
                s+=i;
            }
        }
        s
    }
}

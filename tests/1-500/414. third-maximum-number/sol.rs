impl Solution {
    pub fn third_max(nums: Vec<i32>) -> i32 {
        let mut first: Option<i32> = None;
        let mut second: Option<i32> = None;
        let mut third: Option<i32> = None;
        for num in nums {
            if first == Some(num) || second == Some(num) || third == Some(num) {
                continue;
            }
            if first.is_none() || num > first.unwrap() {
                third = second;
                second = first;
                first = Some(num);
            } else if second.is_none() || num > second.unwrap() {
                third = second;
                second = Some(num);
            } else if third.is_none() || num > third.unwrap() {
                third = Some(num);
            }
        }
        third.unwrap_or(first.unwrap())
    }
}

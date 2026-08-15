impl Solution {
    pub fn maximum_wealth(accounts: Vec<Vec<i32>>) -> i32 {
        let mut rich = 0;
        for i in accounts {
            rich = rich.max(i.iter().sum());
        }
        rich
    }
}

impl Solution {
    pub fn check_record(n: i32) -> i32 {
        let mo: i32 = 1000000007;
        let mut dp = [[1, 0, 0], [0, 0, 0]];
        
        for _ in 0..n {
            let mut ndp = [[0, 0, 0], [0, 0, 0]];
            for absences in 0..2 {
                for lates in 0..3 {
                    let cur = dp[absences][lates];
                    if cur == 0 {
                        continue;
                    }
                    ndp[absences][0] = (ndp[absences][0] + cur) % mo;
                    if absences == 0 {
                        ndp[1][0] = (ndp[1][0] + cur) % mo;
                    }
                    if lates < 2 {
                        ndp[absences][lates + 1] = (ndp[absences][lates + 1] + cur) % mo;
                    }
                }
            }
            dp = ndp;
        }
        
        let mut total = 0;
        for row in &dp {
            for &value in row {
                total = (total + value) % mo;
            }
        }
        total
    }
}

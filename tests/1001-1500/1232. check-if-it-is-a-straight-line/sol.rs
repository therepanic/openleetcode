impl Solution {
    pub fn check_straight_line(coordinates: Vec<Vec<i32>>) -> bool {
        let x1 = coordinates[0][0];
        let y1 = coordinates[0][1];
        let x2 = coordinates[1][0];
        let y2 = coordinates[1][1];
        
        let slope: f64;
        if x2 == x1 {
            slope = f64::INFINITY;
        } else {
            slope = (y2 - y1) as f64 / (x2 - x1) as f64;
        }
        
        let n = coordinates.len();
        for i in 1..n - 1 {
            let x1 = coordinates[i][0];
            let y1 = coordinates[i][1];
            let x2 = coordinates[i + 1][0];
            let y2 = coordinates[i + 1][1];
            
            let curr_slope: f64;
            if x2 == x1 {
                curr_slope = f64::INFINITY;
            } else {
                curr_slope = (y2 - y1) as f64 / (x2 - x1) as f64;
            }
            
            if curr_slope != slope {
                return false;
            }
        }
        
        true
    }
}

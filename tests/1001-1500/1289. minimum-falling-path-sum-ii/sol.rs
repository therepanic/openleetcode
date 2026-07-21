impl Solution {
    pub fn min_falling_path_sum(grid: Vec<Vec<i32>>) -> i32 {
        let n = grid.len();
        let mut dp = grid[0].clone();
        for i in 1..n {
            let mut smallest = i32::MAX;
            let mut second_smallest = i32::MAX;
            let mut smallest_col: i32 = -1;
            for (col, &value) in dp.iter().enumerate() {
                if value < smallest {
                    second_smallest = smallest;
                    smallest = value;
                    smallest_col = col as i32;
                } else if value < second_smallest {
                    second_smallest = value;
                }
            }
            dp = grid[i]
                .iter()
                .enumerate()
                .map(|(col, &value)| {
                    value + if col as i32 == smallest_col {
                        second_smallest
                    } else {
                        smallest
                    }
                })
                .collect();
        }
        *dp.iter().min().unwrap()
    }
}

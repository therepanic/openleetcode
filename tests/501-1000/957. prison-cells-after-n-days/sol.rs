impl Solution {
    pub fn prison_after_n_days(cells: Vec<i32>, n: i32) -> Vec<i32> {
        let mut cells = cells;
        let n = (n - 1) % 14 + 1;
        for _ in 0..n {
            let mut prev = cells[0];
            for i in 1..cells.len() - 1 {
                let current = cells[i];
                if prev == cells[i + 1] {
                    cells[i] = 1;
                } else {
                    cells[i] = 0;
                }
                prev = current;
            }
            cells[0] = 0;
            let last = cells.len() - 1;
            cells[last] = 0;
        }
        cells
    }
}

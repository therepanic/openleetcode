impl Solution {
    pub fn spiral_matrix_iii(rows: i32, cols: i32, r_start: i32, c_start: i32) -> Vec<Vec<i32>> {
        let total = (rows * cols) as usize;
        let mut res: Vec<Vec<i32>> = Vec::with_capacity(total);
        res.push(vec![r_start, c_start]);
        let mut top = r_start;
        let mut bottom = r_start;
        let mut left = c_start;
        let mut right = c_start;
        while res.len() < total {
            right += 1;
            for i in (left + 1)..=right {
                if top >= 0 && top < rows && i >= 0 && i < cols {
                    res.push(vec![top, i]);
                    if res.len() == total {
                        return res;
                    }
                }
            }
            bottom += 1;
            for i in (top + 1)..=bottom {
                if right >= 0 && right < cols && i >= 0 && i < rows {
                    res.push(vec![i, right]);
                    if res.len() == total {
                        return res;
                    }
                }
            }
            left -= 1;
            for i in ((left)..=(right - 1)).rev() {
                if i >= 0 && i < cols && bottom >= 0 && bottom < rows {
                    res.push(vec![bottom, i]);
                    if res.len() == total {
                        return res;
                    }
                }
            }
            top -= 1;
            for i in ((top)..=(bottom - 1)).rev() {
                if i >= 0 && i < rows && left >= 0 && left < cols {
                    res.push(vec![i, left]);
                    if res.len() == total {
                        return res;
                    }
                }
            }
        }
        res
    }
}

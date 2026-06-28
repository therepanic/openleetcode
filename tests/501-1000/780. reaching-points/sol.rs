impl Solution {
    pub fn reaching_points(sx: i32, sy: i32, mut tx: i32, mut ty: i32) -> bool {
        while tx >= sx && ty >= sy {
            if tx == sx {
                return (ty - sy) % tx == 0;
            }
            if ty == sy {
                return (tx - sx) % ty == 0;
            }
            if ty > tx {
                ty = ty % tx;
            } else {
                tx = tx % ty;
            }
        }
        false
    }
}

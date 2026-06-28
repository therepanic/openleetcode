class Solution {
    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var tx = tx
        var ty = ty
        while tx >= sx && ty >= sy {
            if tx == sx {
                return (ty - sy) % tx == 0
            }
            if ty == sy {
                return (tx - sx) % ty == 0
            }
            if ty > tx {
                ty = ty % tx
            } else {
                tx = tx % ty
            }
        }
        return false
    }
}

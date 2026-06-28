class Solution {
    fun reachingPoints(sx: Int, sy: Int, tx: Int, ty: Int): Boolean {
        var tx = tx
        var ty = ty
        while (tx >= sx && ty >= sy) {
            if (tx == sx) {
                return (ty - sy) % tx == 0
            }
            if (ty == sy) {
                return (tx - sx) % ty == 0
            }
            if (ty > tx) {
                ty = ty % tx
            } else {
                tx = tx % ty
            }
        }
        return false
    }
}

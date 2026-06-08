class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let min32 = Int64(Int32.min)
        let max32 = Int64(Int32.max)
        if Int64(dividend) == min32 && divisor == -1 { return Int(Int32.max) }
        let q = Int64(dividend) / Int64(divisor)
        if q < min32 { return Int(Int32.min) }
        if q > max32 { return Int(Int32.max) }
        return Int(q)
    }
}

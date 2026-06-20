class Solution {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var currentLeft = left
        var currentRight = right
        var shift = 0
        while currentLeft < currentRight {
            currentLeft >>= 1
            currentRight >>= 1
            shift += 1
        }
        return currentLeft << shift
    }
}

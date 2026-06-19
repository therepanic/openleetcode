class Solution {
    func constructRectangle(_ area: Int) -> [Int] {
        var w = Int(Double(area).squareRoot())
        while area % w != 0 {
            w -= 1
        }
        return [area / w, w]
    }
}

class Solution {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        return acos(cos((330.0 * Double(hour) + 5.5 * Double(minutes)) * 0.0174532925)) * 57.2957795
    }
}

class Solution {
    func squareIsWhite(_ coordinates: String) -> Bool {
        let chars = Array(coordinates)
        return (Int(chars[0].asciiValue!) - Int(chars[1].asciiValue!)) % 2 != 0
    }
}

class Solution {
    func shiftingLetters(_ s: String, _ shifts: [Int]) -> String {
        let n = shifts.count
        var l = [Int](repeating: 0, count: n)
        let z = shifts.reduce(0, +)
        l[0] = z
        for i in 1..<n {
            l[i] = l[i - 1] - shifts[i - 1]
        }
        let p = s.map { Int($0.asciiValue! - 97) }
        var k = ""
        for i in 0..<n {
            k.append(Character(UnicodeScalar((p[i] + l[i]) % 26 + 97)!))
        }
        return k
    }
}

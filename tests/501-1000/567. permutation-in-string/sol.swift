class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let n1 = s1.count, n2 = s2.count
        if n2 < n1 { return false }

        var c1 = [Int](repeating: 0, count: 26)
        var c2 = [Int](repeating: 0, count: 26)
        let a = Int(Character("a").asciiValue!)

        let s1Arr = Array(s1.utf8)
        let s2Arr = Array(s2.utf8)

        for i in 0..<n1 {
            c1[Int(s1Arr[i]) - a] += 1
            c2[Int(s2Arr[i]) - a] += 1
        }

        if c1 == c2 { return true }

        for i in n1..<n2 {
            c2[Int(s2Arr[i]) - a] += 1
            c2[Int(s2Arr[i - n1]) - a] -= 1

            if c1 == c2 { return true }
        }

        return false
    }
}

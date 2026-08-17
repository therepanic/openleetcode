class Solution {
    func decrypt(_ code: [Int], _ k: Int) -> [Int] {
        let n = code.count
        var result = [Int](repeating: 0, count: n)
        
        if k == 0 { return result }

        let window = abs(k)
        var total = 0

        var start = k > 0 ? 1 : n - window
        var end = k > 0 ? window : n - 1

        for i in start...end {
            total += code[i % n]
        }
        for i in 0..<n {
            result[i] = total

            total -= code[start % n]
            start += 1

            end += 1
            total += code[end % n]
        }
        return result
    }
}

class Solution {
    func makeFancyString(_ s: String) -> String {
        if s.isEmpty { return "" }
        var result = String(s.first!)
        var last = s.first!
        var count = 1

        for ch in s.dropFirst() {
            if ch != last {
                last = ch
                count = 0
            }

            count += 1
            if count > 2 { continue }

            result.append(ch)
        }

        return result
    }
}

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        let chars = Array(s)
        var result = [String]()
        var parts = [String]()

        func isValid(_ segment: String) -> Bool {
            if segment.count > 1 && segment.first == "0" {
                return false
            }
            return Int(segment)! <= 255
        }

        func backtrack(_ index: Int) {
            if parts.count == 4 {
                if index == chars.count {
                    result.append(parts.joined(separator: "."))
                }
                return
            }

            var segment = ""
            var end = index
            while end < chars.count && end < index + 3 {
                segment.append(chars[end])
                if isValid(segment) {
                    parts.append(segment)
                    backtrack(end + 1)
                    parts.removeLast()
                }
                end += 1
            }
        }

        backtrack(0)
        return result
    }
}

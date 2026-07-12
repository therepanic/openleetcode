class Solution {
    func queryString(_ s: String, _ n: Int) -> Bool {
        let chars = Array(s)
        for num in stride(from: n, through: 1, by: -1) {
            let target = String(num, radix: 2)
            let length = target.count
            var left = 0
            var valid = false
            for right in 0..<chars.count {
                while right - left + 1 > length {
                    left += 1
                }
                if String(chars[left...right]) == target {
                    valid = true
                    break
                }
            }
            if !valid {
                return false
            }
        }
        return true
    }
}

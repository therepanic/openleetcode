class Solution {
    func convertToBase7(_ num: Int) -> String {
        if num == 0 {
            return "0"
        }
        let sign = num < 0 ? "-" : ""
        var num = abs(num)
        var result = ""
        while num > 0 {
            result = String(num % 7) + result
            num /= 7
        }
        return sign + result
    }
}

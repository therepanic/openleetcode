class Solution {
    func findNthDigit(_ n: Int) -> Int {
        var n = n
        var i = 1
        var count = 9
        var start = 1

        while n > i * count {
            n -= i * count
            i += 1
            count *= 10
            start *= 10
        }

        let number = start + (n - 1) / i
        let str = String(number)
        let index = str.index(str.startIndex, offsetBy: (n - 1) % i)
        return Int(String(str[index]))!
    }
}

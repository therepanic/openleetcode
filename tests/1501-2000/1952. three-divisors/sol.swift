class Solution {
    func isThree(_ n: Int) -> Bool {
        var count = 0
        for i in 1...n {
            if n % i == 0 {
                count += 1
            }
        }
        return count == 3
    }
}

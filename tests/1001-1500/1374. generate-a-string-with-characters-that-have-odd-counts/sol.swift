class Solution {
    func generateTheString(_ n: Int) -> String {
        if n % 2 == 1 {
            return String(repeating: "a", count: n)
        } else {
            return String(repeating: "a", count: n - 1) + "b"
        }
    }
}

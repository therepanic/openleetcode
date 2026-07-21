class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var s = String(num)
        if let range = s.range(of: "6") {
            s.replaceSubrange(range, with: "9")
        }
        return Int(s)!
    }
}

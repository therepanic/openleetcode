class Solution {
    func maximumSwap(_ num: Int) -> Int {
        var numList = Array(String(num))
        var lastIndex = [Int: Int]()
        for (i, c) in numList.enumerated() {
            lastIndex[Int(String(c))!] = i
        }
        for (i, c) in numList.enumerated() {
            let d = Int(String(c))!
            for x in stride(from: 9, through: d + 1, by: -1) {
                if let idx = lastIndex[x], idx > i {
                    numList.swapAt(i, idx)
                    return Int(String(numList))!
                }
            }
        }
        return num
    }
}

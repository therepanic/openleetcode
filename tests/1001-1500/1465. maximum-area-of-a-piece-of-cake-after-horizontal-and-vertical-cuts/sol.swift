class Solution {
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        let MOD = 1_000_000_007
        
        let horizontalCuts = horizontalCuts.sorted()
        let verticalCuts = verticalCuts.sorted()
        
        var maxH = max(horizontalCuts[0], h - horizontalCuts.last!)
        for i in 1..<horizontalCuts.count {
            maxH = max(maxH, horizontalCuts[i] - horizontalCuts[i - 1])
        }
        
        var maxV = max(verticalCuts[0], w - verticalCuts.last!)
        for i in 1..<verticalCuts.count {
            maxV = max(maxV, verticalCuts[i] - verticalCuts[i - 1])
        }
        
        return (maxH * maxV) % MOD
    }
}

class Solution {
    func minStickers(_ stickers: [String], _ target: String) -> Int {
        var memo = [String: Int]()
        
        func dfs(_ idx: Int, _ target: String) -> Int {
            if target.isEmpty { return 0 }
            if idx == stickers.count { return Int.max }
            
            let key = "\(idx),\(target)"
            if let cached = memo[key] { return cached }
            
            var result = dfs(idx + 1, target)
            
            let currentSticker = stickers[idx]
            var newTarget = Array(target)
            var somethingRemoved = false
            for c in currentSticker {
                if let idxToRemove = newTarget.firstIndex(of: c) {
                    newTarget.remove(at: idxToRemove)
                    somethingRemoved = true
                }
            }
            
            if somethingRemoved {
                let subResult = dfs(idx, String(newTarget))
                if subResult != Int.max {
                    result = min(result, 1 + subResult)
                }
            }
            
            memo[key] = result
            return result
        }
        
        let result = dfs(0, target)
        return result == Int.max ? -1 : result
    }
}

class Solution {
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        if changed.count % 2 != 0 { return [] }
        
        var count = [Int: Int]()
        for num in changed {
            count[num, default: 0] += 1
        }
        let sorted = changed.sorted()
        var original = [Int]()
        
        for num in sorted {
            if count[num] == 0 { continue }
            if count[2 * num] == nil || count[2 * num] == 0 { return [] }
            original.append(num)
            count[num]! -= 1
            count[2 * num]! -= 1
        }
        
        return original
    }
}

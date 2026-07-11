class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        var hashmap = [Int: Int]()
        for h in hand {
            hashmap[h, default: 0] += 1
        }
        
        var minHeap = hashmap.keys.sorted()
        var idx = 0
        
        while idx < minHeap.count {
            let first = minHeap[idx]
            for i in first..<first + groupSize {
                guard hashmap[i] != nil else {
                    return false
                }
                hashmap[i]! -= 1
                if hashmap[i] == 0 {
                    if i != minHeap[idx] {
                        return false
                    }
                    idx += 1
                }
            }
        }
        return true
    }
}

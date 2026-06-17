class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        var events = [[Int]]()
        for b in buildings {
            let L = b[0], R = b[1], H = b[2]
            events.append([L, -H])
            events.append([R, H])
        }
        events.sort { a, b in
            if a[0] != b[0] {
                return a[0] < b[0]
            }
            return a[1] < b[1]
        }
        
        var result = [[Int]]()
        var liveBuildings = [0] // max-heap simulated using negative values
        var pastBuildings = [Int: Int]()
        var prevMax = 0
        
        for e in events {
            let x = e[0], h = e[1]
            if h < 0 {
                // insert into sorted array (simulating heap)
                liveBuildings.append(-h)
                liveBuildings.sort(by: >)
            } else {
                pastBuildings[h, default: 0] += 1
            }
            
            while let top = liveBuildings.first, pastBuildings[top] != nil {
                liveBuildings.removeFirst()
                pastBuildings[top]! -= 1
                if pastBuildings[top] == 0 {
                    pastBuildings.removeValue(forKey: top)
                }
            }
            
            let currMax = liveBuildings.first ?? 0
            if currMax != prevMax {
                result.append([x, currMax])
                prevMax = currMax
            }
        }
        
        return result
    }
}

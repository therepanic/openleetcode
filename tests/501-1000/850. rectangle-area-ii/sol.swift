class Solution {
    func rectangleArea(_ rectangles: [[Int]]) -> Int {
        let OPEN = 0
        let CLOSE = 1
        let MOD = 1000000007
        
        var events = [(Int, Int, Int, Int)]()
        for r in rectangles {
            let x1 = r[0], y1 = r[1], x2 = r[2], y2 = r[3]
            events.append((y1, OPEN, x1, x2))
            events.append((y2, CLOSE, x1, x2))
        }
        events.sort { $0.0 < $1.0 }
        
        var res = 0
        var curY = events[0].0
        var active = [(Int, Int)]()
        
        for e in events {
            let y = e.0, typ = e.1, x1 = e.2, x2 = e.3
            
            var q = 0
            var cur = -1
            active.sort { $0.0 < $1.0 }
            for seg in active {
                q += max(0, seg.1 - max(cur, seg.0))
                cur = max(cur, seg.1)
            }
            
            res = (res + q * (y - curY)) % MOD
            curY = y
            
            if typ == OPEN {
                active.append((x1, x2))
            } else {
                if let index = active.firstIndex(where: { $0.0 == x1 && $0.1 == x2 }) {
                    active.remove(at: index)
                }
            }
        }
        
        return res
    }
}

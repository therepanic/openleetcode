class Solution {
    func closestRoom(_ rooms: [[Int]], _ queries: [[Int]]) -> [Int] {
        var rooms = rooms.sorted { $0[1] > $1[1] }
        let indexed = queries.indices.sorted { queries[$0][1] > queries[$1][1] }

        var active = [Int]()
        var result = Array(repeating: -1, count: queries.count)
        var roomPtr = 0

        for qi in indexed {
            let preferred = queries[qi][0]
            let minimum = queries[qi][1]

            while roomPtr < rooms.count && rooms[roomPtr][1] >= minimum {
                let id = rooms[roomPtr][0]
                // insert into sorted active
                var lo = 0
                var hi = active.count
                while lo < hi {
                    let mid = (lo + hi) / 2
                    if active[mid] < id {
                        lo = mid + 1
                    } else {
                        hi = mid
                    }
                }
                active.insert(id, at: lo)
                roomPtr += 1
            }

            // find first >= preferred
            var lo = 0
            var hi = active.count
            while lo < hi {
                let mid = (lo + hi) / 2
                if active[mid] < preferred {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            let pos = lo

            var candidates = [Int]()
            if pos < active.count {
                candidates.append(active[pos])
            }
            if pos > 0 {
                candidates.append(active[pos - 1])
            }

            if !candidates.isEmpty {
                result[qi] = candidates.min { (a, b) -> Bool in
                    let diffA = abs(a - preferred)
                    let diffB = abs(b - preferred)
                    if diffA != diffB {
                        return diffA < diffB
                    }
                    return a < b
                }!
            }
        }
        return result
    }
}

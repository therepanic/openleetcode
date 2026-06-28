class Solution {
    func canTransform(_ start: String, _ result: String) -> Bool {
        let n = start.count
        var i = start.startIndex
        var j = result.startIndex
        
        let startEnd = start.endIndex
        let resultEnd = result.endIndex

        while i < startEnd || j < resultEnd {
            while i < startEnd && start[i] == "X" {
                i = start.index(after: i)
            }
            while j < resultEnd && result[j] == "X" {
                j = result.index(after: j)
            }

            if (i == startEnd) != (j == resultEnd) {
                return false
            }

            if i < startEnd && j < resultEnd {
                if start[i] != result[j] {
                    return false
                }
                if start[i] == "L" && start.distance(from: start.startIndex, to: j) > start.distance(from: start.startIndex, to: i) {
                    return false
                }
                if start[i] == "R" && start.distance(from: start.startIndex, to: j) < start.distance(from: start.startIndex, to: i) {
                    return false
                }
            }

            if i < startEnd {
                i = start.index(after: i)
            }
            if j < resultEnd {
                j = result.index(after: j)
            }
        }

        return true
    }
}

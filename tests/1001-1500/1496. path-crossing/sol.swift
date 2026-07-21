class Solution {
    func isPathCrossing(_ path: String) -> Bool {
        var set = Set<String>()
        var x = 0, y = 0
        set.insert("0,0")
        for c in path {
            switch c {
            case "N": y += 1
            case "S": y -= 1
            case "E": x += 1
            case "W": x -= 1
            default: break
            }
            let point = "\(x),\(y)"
            if set.contains(point) { return true }
            set.insert(point)
        }
        return false
    }
}

class Solution {
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        let n = s.count
        var seen = Set<String>()
        var queue = [s]
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if seen.contains(cur) { continue }
            seen.insert(cur)
            var arr = Array(cur)
            var i = 1
            while i < arr.count {
                arr[i] = Character(String((Int(String(arr[i]))! + a) % 10))
                i += 2
            }
            queue.append(String(arr))
            let rot = String(cur.suffix(n - b)) + String(cur.prefix(b))
            queue.append(rot)
        }
        return seen.min()!
    }
}

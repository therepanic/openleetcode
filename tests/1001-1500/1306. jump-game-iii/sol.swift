class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var seen = Set<Int>()
        var queue = [start]
        var head = 0
        while head < queue.count {
            let index = queue[head]
            head += 1
            if index < 0 || index >= arr.count || seen.contains(index) {
                continue
            }
            if arr[index] == 0 {
                return true
            }
            seen.insert(index)
            queue.append(index + arr[index])
            queue.append(index - arr[index])
        }
        return false
    }
}

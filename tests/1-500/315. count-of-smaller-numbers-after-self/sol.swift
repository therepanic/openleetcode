class Solution {
    func countSmaller(_ nums: [Int]) -> [Int] {
        var sortedList: [Int] = []
        var ans: [Int] = []
        for n in nums.reversed() {
            let idx = bisectLeft(sortedList, n)
            ans.append(idx)
            sortedList.insert(n, at: idx)
        }
        return ans.reversed()
    }
    
    private func bisectLeft(_ list: [Int], _ target: Int) -> Int {
        var lo = 0, hi = list.count
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            if list[mid] >= target {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var res = [Int]()
        var q = [Int]()
        for idx in 0..<nums.count {
            let num = nums[idx]
            while !q.isEmpty && q.last! < num {
                q.removeLast()
            }
            q.append(num)
            if idx >= k && nums[idx - k] == q.first! {
                q.removeFirst()
            }
            if idx >= k - 1 {
                res.append(q.first!)
            }
        }
        return res
    }
}

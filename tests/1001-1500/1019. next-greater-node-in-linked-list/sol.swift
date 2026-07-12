class Solution {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        var arr = [Int]()
        var curr = head
        while let node = curr {
            arr.append(node.val)
            curr = node.next
        }
        let n = arr.count
        var ans = [Int](repeating: 0, count: n)
        var stack = [Int]()
        for i in 0..<n {
            while !stack.isEmpty && arr[i] > arr[stack.last!] {
                ans[stack.removeLast()] = arr[i]
            }
            stack.append(i)
        }
        return ans
    }
}

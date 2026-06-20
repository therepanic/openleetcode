class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var nextGreater = [Int: Int]()
        var stack = [Int]()
        
        for num in nums2.reversed() {
            while !stack.isEmpty && stack.last! <= num {
                stack.removeLast()
            }
            nextGreater[num] = stack.isEmpty ? -1 : stack.last!
            stack.append(num)
        }
        
        return nums1.map { nextGreater[$0]! }
    }
}

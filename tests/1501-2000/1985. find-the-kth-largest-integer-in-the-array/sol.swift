class Solution {
    func kthLargestNumber(_ nums: [String], _ k: Int) -> String {
        let arr = nums.sorted {
            if $0.count != $1.count { return $0.count > $1.count }
            return $0 > $1
        }
        return arr[k - 1]
    }
}

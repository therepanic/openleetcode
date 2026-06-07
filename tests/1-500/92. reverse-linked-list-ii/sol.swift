class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let values = list_node_to_array(head)
        var result = values
        let reversed = Array(result[(left - 1)..<right].reversed())
        for i in 0..<reversed.count {
            result[left - 1 + i] = reversed[i]
        }
        return to_list_node(result)
    }
}

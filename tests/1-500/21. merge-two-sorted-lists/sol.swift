class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil || list2 == nil { return list1 ?? list2 }
        var list1 = list1
        var list2 = list2
        if list1!.val > list2!.val {
            swap(&list1, &list2)
        }
        list1!.next = mergeTwoLists(list1!.next, list2)
        return list1
    }
}

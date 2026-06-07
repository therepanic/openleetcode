class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        return mergeRange(lists, 0, lists.count - 1)
    }

    private func mergeRange(_ lists: [ListNode?], _ left: Int, _ right: Int) -> ListNode? {
        if left == right { return lists[left] }
        let mid = left + (right - left) / 2
        return mergeTwoLists(mergeRange(lists, left, mid), mergeRange(lists, mid + 1, right))
    }

    private func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil || list2 == nil { return list1 ?? list2 }
        var list1 = list1
        var list2 = list2
        if list1!.val > list2!.val { swap(&list1, &list2) }
        list1!.next = mergeTwoLists(list1!.next, list2)
        return list1
    }
}

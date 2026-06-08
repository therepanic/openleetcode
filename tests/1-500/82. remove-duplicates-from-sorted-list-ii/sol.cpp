class Solution {
public:
    ListNode* deleteDuplicates(ListNode* head) {
        ListNode dummy(0, head);
        ListNode* prev = &dummy;
        ListNode* cur = head;
        while (cur != nullptr) {
            bool dup = false;
            while (cur->next != nullptr && cur->val == cur->next->val) {
                dup = true;
                cur = cur->next;
            }
            if (dup) prev->next = cur->next;
            else prev = prev->next;
            cur = cur->next;
        }
        return dummy.next;
    }
};

class Solution {
public:
    ListNode* swapPairs(ListNode* head) {
        if (!head || !head->next) return head;
        ListNode* second = head->next;
        head->next = swapPairs(second->next);
        second->next = head;
        return second;
    }
};

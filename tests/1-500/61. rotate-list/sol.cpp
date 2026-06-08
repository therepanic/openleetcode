class Solution {
public:
    ListNode* rotateRight(ListNode* head, int k) {
        if (!head || !head->next || k == 0) {
            return head;
        }

        int len = 1;
        ListNode* tail = head;
        while (tail->next) {
            tail = tail->next;
            ++len;
        }

        k %= len;
        if (k == 0) {
            return head;
        }

        tail->next = head;
        int steps = len - k;
        ListNode* newTail = head;
        for (int i = 1; i < steps; ++i) {
            newTail = newTail->next;
        }

        ListNode* newHead = newTail->next;
        newTail->next = nullptr;
        return newHead;
    }
};

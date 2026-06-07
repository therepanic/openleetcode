class Solution {
public:
    ListNode* partition(ListNode* head, int x) {
        ListNode smallDummy(0), bigDummy(0);
        ListNode* small = &smallDummy;
        ListNode* big = &bigDummy;
        while (head != nullptr) {
            ListNode* next = head->next;
            head->next = nullptr;
            if (head->val < x) {
                small->next = head;
                small = small->next;
            } else {
                big->next = head;
                big = big->next;
            }
            head = next;
        }
        small->next = bigDummy.next;
        return smallDummy.next;
    }
};

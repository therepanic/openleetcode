class Solution {
public:
    ListNode* sortList(ListNode* head) {
        vector<int> values;
        for (ListNode* cur = head; cur; cur = cur->next) values.push_back(cur->val);
        sort(values.begin(), values.end());
        ListNode dummy(0);
        ListNode* tail = &dummy;
        for (int v : values) { tail->next = new ListNode(v); tail = tail->next; }
        return dummy.next;
    }
};

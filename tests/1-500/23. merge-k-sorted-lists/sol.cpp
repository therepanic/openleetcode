class Solution {
public:
    ListNode* mergeKLists(vector<ListNode*>& lists) {
        if (lists.empty()) return nullptr;
        return mergeRange(lists, 0, (int)lists.size() - 1);
    }
private:
    ListNode* mergeRange(vector<ListNode*>& lists, int l, int r) {
        if (l == r) return lists[l];
        int m = l + (r - l) / 2;
        return mergeTwoLists(mergeRange(lists, l, m), mergeRange(lists, m + 1, r));
    }
    ListNode* mergeTwoLists(ListNode* a, ListNode* b) {
        if (!a || !b) return a ? a : b;
        if (a->val > b->val) swap(a, b);
        a->next = mergeTwoLists(a->next, b);
        return a;
    }
};

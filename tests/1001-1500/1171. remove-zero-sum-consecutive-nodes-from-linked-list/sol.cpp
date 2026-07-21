/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* removeZeroSumSublists(ListNode* head) {
        ListNode* dummy = new ListNode(0);
        dummy->next = head;
        int prefixSum = 0;
        std::unordered_map<int, ListNode*> seen;

        ListNode* curr = dummy;
        while (curr) {
            prefixSum += curr->val;
            seen[prefixSum] = curr;
            curr = curr->next;
        }

        prefixSum = 0;
        curr = dummy;
        while (curr) {
            prefixSum += curr->val;
            curr->next = seen[prefixSum]->next;
            curr = curr->next;
        }

        return dummy->next;
    }
};

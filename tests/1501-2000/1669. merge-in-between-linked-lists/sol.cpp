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
    ListNode* mergeInBetween(ListNode* list1, int a, int b, ListNode* list2) {
        ListNode* curr = list1;
        for (int i = 0; i < a-1; i++) {
            curr = curr->next;
        }
        ListNode* prev = curr;
        for (int i = 0; i < b-a+2; i++) {
            curr = curr->next;
        }
        prev->next = list2;
        prev = prev->next;
        while (prev->next != nullptr) {
            prev = prev->next;
        }
        prev->next = curr;
        return list1;
    }
};

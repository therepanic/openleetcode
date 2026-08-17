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
    ListNode* swapNodes(ListNode* head, int k) {
        if (head == nullptr || head->next == nullptr) {
            return head;
        }

        ListNode* temp = head;
        ListNode* firstPrev = nullptr;

        int n = 1;
        while (n < k) {
            firstPrev = temp;
            temp = temp->next;
            n++;
        }

        ListNode* first = temp;

        ListNode* second = head;
        ListNode* secondPrev = nullptr;
        temp = first;
        while (temp->next != nullptr) {
            secondPrev = second;
            temp = temp->next;
            second = second->next;
        }

        if (firstPrev != nullptr) {
            firstPrev->next = second;
        }
        if (secondPrev != nullptr) {
            secondPrev->next = first;
        }

        ListNode* tempNext = first->next;
        first->next = second->next;
        second->next = tempNext;

        if (k == 1) {
            return second;
        }
        if (second == head) {
            return first;
        }

        return head;
    }
};

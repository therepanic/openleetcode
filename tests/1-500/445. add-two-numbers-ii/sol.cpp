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
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        vector<int> s1;
        vector<int> s2;

        while (l1) {
            s1.push_back(l1->val);
            l1 = l1->next;
        }

        while (l2) {
            s2.push_back(l2->val);
            l2 = l2->next;
        }

        int carry = 0;
        ListNode* head = nullptr;
        while (!s1.empty() || !s2.empty() || carry > 0) {
            int sum = carry;
            if (!s1.empty()) {
                sum += s1.back();
                s1.pop_back();
            }
            if (!s2.empty()) {
                sum += s2.back();
                s2.pop_back();
            }
            head = new ListNode(sum % 10, head);
            carry = sum / 10;
        }

        while (head && head->val == 0 && head->next) {
            head = head->next;
        }

        return head;
    }
};

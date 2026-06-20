/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
import 'dart:math';

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    String s1 = '';
    while (l1 != null) {
      s1 += l1.val.toString();
      l1 = l1.next;
    }

    String s2 = '';
    while (l2 != null) {
      s2 += l2.val.toString();
      l2 = l2.next;
    }

    BigInt n1 = BigInt.parse(s1);
    BigInt n2 = BigInt.parse(s2);
    String r = (n1 + n2).toString();

    ListNode dummy = ListNode(0);
    ListNode cur = dummy;

    for (int i = 0; i < r.length; i++) {
      cur.next = ListNode(int.parse(r[i]));
      cur = cur.next!;
    }

    return dummy.next;
  }
}

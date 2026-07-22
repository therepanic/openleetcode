/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

function isSubPath(head: ListNode | null, root: TreeNode | null): boolean {
  const matches = (
    node: TreeNode | null,
    current: ListNode | null,
  ): boolean => {
    if (current === null) return true;
    if (node === null || node.val !== current.val) return false;
    return (
      matches(node.left, current.next) || matches(node.right, current.next)
    );
  };

  if (root === null) return false;
  return (
    matches(root, head) ||
    isSubPath(head, root.left) ||
    isSubPath(head, root.right)
  );
}

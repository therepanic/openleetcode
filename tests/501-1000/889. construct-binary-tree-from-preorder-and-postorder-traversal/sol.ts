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

function constructFromPrePost(
  preorder: number[],
  postorder: number[],
): TreeNode | null {
  let index = 0;

  function build(left: number, right: number): TreeNode | null {
    if (index >= preorder.length || left > right) {
      return null;
    }

    const root = new TreeNode(preorder[index++]);
    if (left === right || index >= preorder.length) {
      return root;
    }

    let split = left;
    while (split <= right && postorder[split] !== preorder[index]) {
      split++;
    }

    if (split <= right) {
      root.left = build(left, split);
      root.right = build(split + 1, right - 1);
    }

    return root;
  }

  return build(0, postorder.length - 1);
}

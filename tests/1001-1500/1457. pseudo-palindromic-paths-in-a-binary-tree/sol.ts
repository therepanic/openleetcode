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

function pseudoPalindromicPaths(root: TreeNode | null): number {
  let count = 0;
  const counter = new Array(10).fill(0);

  function checkPalindromic(): boolean {
    let odd = 0;
    for (let i = 1; i <= 9; i++) {
      if (counter[i] % 2 === 1) {
        odd++;
        if (odd > 1) return false;
      }
    }
    return true;
  }

  function dfs(node: TreeNode | null): void {
    if (node === null) return;

    counter[node.val]++;

    if (node.left === null && node.right === null) {
      if (checkPalindromic()) count++;
    } else {
      dfs(node.left);
      dfs(node.right);
    }

    counter[node.val]--;
  }

  dfs(root);
  return count;
}

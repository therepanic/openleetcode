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

function isEvenOddTree(root: TreeNode | null): boolean {
  const elements: number[][] = [[]];
  function collect(temp: TreeNode | null, pos: number): boolean {
    if (temp === null) return true;
    if (elements.length === pos) elements.push([]);
    const posCheck = pos % 2;
    const valCheck = temp.val % 2;
    if (posCheck === 0 && valCheck !== 0) {
      if (
        elements[pos].length > 0 &&
        !(elements[pos][elements[pos].length - 1] < temp.val)
      )
        return false;
      elements[pos].push(temp.val);
    } else if (posCheck !== 0 && valCheck === 0) {
      if (
        elements[pos].length > 0 &&
        !(elements[pos][elements[pos].length - 1] > temp.val)
      )
        return false;
      elements[pos].push(temp.val);
    } else {
      return false;
    }
    return collect(temp.left, pos + 1) && collect(temp.right, pos + 1);
  }
  return collect(root, 0);
}

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

function smallestFromLeaf(root: TreeNode | null): string {
  let smallestString: string = "";
  const nodeQueue: [TreeNode, string][] = [];

  nodeQueue.push([root!, String.fromCharCode(root!.val + 97)]);

  while (nodeQueue.length > 0) {
    const [node, currentString] = nodeQueue.shift()!;

    if (node.left === null && node.right === null) {
      if (smallestString === "" || currentString < smallestString) {
        smallestString = currentString;
      }
    }

    if (node.left !== null) {
      nodeQueue.push([
        node.left,
        String.fromCharCode(node.left.val + 97) + currentString,
      ]);
    }

    if (node.right !== null) {
      nodeQueue.push([
        node.right,
        String.fromCharCode(node.right.val + 97) + currentString,
      ]);
    }
  }

  return smallestString;
}

class Solution:
    def diameterOfBinaryTree(self, root):

        def height(node):

            if node is None:
                return 0

            return 1 + max(height(node.left), height(node.right))

        def diameter(node):

            if node is None:
                return 0

            diameter_through_node = height(node.left) + height(node.right)

            left_diameter = diameter(node.left)
            right_diameter = diameter(node.right)

            return max(diameter_through_node, left_diameter, right_diameter)

        return diameter(root)

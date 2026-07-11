# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer[]} to_delete
# @return {TreeNode[]}
def del_nodes(root, to_delete)
  ans = []
  return ans if root.nil?

  st = to_delete.to_set
  ref = TreeNode.new(-1)
  ref.left = root

  q1 = []
  to_process = [ref]

  until to_process.empty?
    new_tree = to_process.shift

    if new_tree.left
      if st.include?(new_tree.left.val)
        to_process.push(new_tree.left)
      else
        ans.push(new_tree.left)
        q1.push(new_tree.left)
      end
      new_tree.left = nil
    end

    if new_tree.right
      if st.include?(new_tree.right.val)
        to_process.push(new_tree.right)
      else
        ans.push(new_tree.right)
        q1.push(new_tree.right)
      end
      new_tree.right = nil
    end

    until q1.empty?
      temp = q1.shift

      if temp.left
        if st.include?(temp.left.val)
          to_process.push(temp.left)
          temp.left = nil
        else
          q1.push(temp.left)
        end
      end

      if temp.right
        if st.include?(temp.right.val)
          to_process.push(temp.right)
          temp.right = nil
        else
          q1.push(temp.right)
        end
      end
    end
  end

  ans
end

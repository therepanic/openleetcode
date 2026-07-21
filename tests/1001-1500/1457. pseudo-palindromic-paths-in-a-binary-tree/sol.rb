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
# @return {Integer}
def pseudo_palindromic_paths (root)
    def check_palindromic(counter)
        odd = 0
        (1..9).each do |i|
            if counter[i] % 2 == 1
                odd += 1
                return false if odd > 1
            end
        end
        true
    end

    def dfs(node, counter, count)
        return if node.nil?

        counter[node.val] += 1

        if node.left.nil? && node.right.nil?
            count[0] += 1 if check_palindromic(counter)
        else
            dfs(node.left, counter, count)
            dfs(node.right, counter, count)
        end

        counter[node.val] -= 1
    end

    count = [0]
    counter = [0] * 10
    dfs(root, counter, count)
    count[0]
end

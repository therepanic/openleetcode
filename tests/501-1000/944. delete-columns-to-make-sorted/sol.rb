# @param {String[]} strs
# @return {Integer}
def min_deletion_size(strs)
  rows = strs.length
  cols = strs[0].length
  deletions = 0

  (0...cols).each do |c|
    (0...rows - 1).each do |r|
      if strs[r][c] > strs[r + 1][c]
        deletions += 1
        break
      end
    end
  end

  deletions
end

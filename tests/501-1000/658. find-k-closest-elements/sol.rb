# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
def find_closest_elements(arr, k, x)
    arr.sort_by { |num| [(num - x).abs, num] }[0...k].sort
end

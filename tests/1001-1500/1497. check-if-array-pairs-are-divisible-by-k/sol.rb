# @param {Integer[]} arr
# @param {Integer} k
# @return {Boolean}
def can_arrange(arr, k)
  a = arr.map { |v| v % k }.sort
  j = a.count(0)
  return false unless j.even?
  b = a[j..]
  b.zip(b.reverse).all? { |p, q| (p + q) % k == 0 }
end

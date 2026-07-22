# @param {Integer[]} queries
# @param {Integer} m
# @return {Integer[]}
def process_queries(queries, m)
  arr = (1..m).to_a
  ans = []
  queries.each do |x|
    ans << arr.index(x)
    arr.delete(x)
    arr.unshift(x)
  end
  ans
end

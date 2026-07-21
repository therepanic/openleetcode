# @param {Integer[]} arr
# @param {Integer[][]} queries
# @return {Integer[]}
def xor_queries(arr, queries)
    prefix = [0]
    arr.each do |num|
        prefix << (prefix[-1] ^ num)
    end
    queries.map { |a, b| prefix[b + 1] ^ prefix[a] }
end

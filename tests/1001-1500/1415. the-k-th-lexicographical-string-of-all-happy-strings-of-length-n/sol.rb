# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_happy_string(n, k)
    total = 3 * (2 ** (n - 1))
    return "" if k > total
    
    k -= 1
    result = []
    last = ""
    
    n.times do |pos|
        branch = 2 ** (n - pos - 1)
        choices = ["a", "b", "c"].select { |c| c != last }
        
        idx = k / branch
        result.push(choices[idx])
        
        last = choices[idx]
        k %= branch
    end
    
    result.join
end

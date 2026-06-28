# @param {String} s
# @return {Integer}
def strange_printer(s)
    memo = {}
    
    min_turns = lambda do |start_val, end_val|
        return 0 if start_val > end_val
        
        key = [start_val, end_val]
        return memo[key] if memo.key?(key)
        
        res = min_turns.call(start_val, end_val - 1) + 1
        
        (start_val...end_val).each do |middle|
            if s[middle] == s[end_val]
                res = [res, min_turns.call(start_val, middle) + min_turns.call(middle + 1, end_val - 1)].min
            end
        end
        
        memo[key] = res
        res
    end
    
    min_turns.call(0, s.length - 1)
end

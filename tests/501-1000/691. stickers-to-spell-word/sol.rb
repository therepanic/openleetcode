# @param {String[]} stickers
# @param {String} target
# @return {Integer}
def min_stickers(stickers, target)
    dfs = lambda do |idx, target, memo|
        return 0 if target.empty?
        return Float::INFINITY if idx == stickers.length
        
        key = [idx, target]
        return memo[key] if memo.key?(key)
        
        result = dfs.call(idx + 1, target, memo)
        
        current_sticker = stickers[idx]
        new_target = target.dup
        something_removed = false
        current_sticker.each_char do |c|
            idx_to_remove = new_target.index(c)
            if idx_to_remove
                new_target.slice!(idx_to_remove)
                something_removed = true
            end
        end
        
        if something_removed
            result = [result, 1 + dfs.call(idx, new_target, memo)].min
        end
        
        memo[key] = result
        result
    end
    
    result = dfs.call(0, target, {})
    result == Float::INFINITY ? -1 : result
end

# @param {String} stamp
# @param {String} target
# @return {Integer[]}
def moves_to_stamp(stamp, target)
    m = stamp.length
    n = target.length
    stamp_arr = stamp.chars
    target_arr = target.chars
    
    can_stamp = lambda do |i|
        m.times do |j|
            if target_arr[i + j] != '?' && target_arr[i + j] != stamp_arr[j]
                return false
            end
        end
        true
    end
    
    apply_stamp = lambda do |i|
        m.times do |j|
            target_arr[i + j] = '?'
        end
    end
    
    stamped = Array.new(n, false)
    result = []
    queue = []
    
    (0..n - m).each do |i|
        if can_stamp.call(i)
            queue.push(i)
            apply_stamp.call(i)
            result.push(i)
            stamped[i] = true
        end
    end
    
    while !queue.empty?
        pos = queue.shift
        start = [0, pos - m + 1].max
        finish = [n - m, pos + m].min
        (start..finish).each do |i|
            if can_stamp.call(i)
                if !stamped[i]
                    queue.push(i)
                    apply_stamp.call(i)
                    result.push(i)
                    stamped[i] = true
                end
            end
        end
    end
    
    if target_arr.all? { |c| c == '?' }
        return result.reverse
    else
        return []
    end
end

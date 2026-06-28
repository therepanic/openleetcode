# @param {String[]} deadends
# @param {String} target
# @return {Integer}
def open_lock(deadends, target)
    return 0 if target == "0000"
    dead = deadends.to_set
    return -1 if dead.include?("0000")
    
    moves = 0
    queue = ["0000"]
    visited = Set["0000"]
    
    while !queue.empty?
        queue.size.times do
            cur = queue.shift
            return moves if cur == target
            
            4.times do |i|
                val = cur[i].to_i
                up = (val + 1) % 10
                down = (val - 1) % 10
                
                nxt1 = cur[0...i] + up.to_s + cur[i+1..]
                nxt2 = cur[0...i] + down.to_s + cur[i+1..]
                
                [nxt1, nxt2].each do |nxt|
                    unless dead.include?(nxt) || visited.include?(nxt)
                        visited.add(nxt)
                        queue.push(nxt)
                    end
                end
            end
        end
        moves += 1
    end
    -1
end

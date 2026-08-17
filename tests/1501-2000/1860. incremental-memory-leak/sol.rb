# @param {Integer} memory1
# @param {Integer} memory2
# @return {Integer[]}
def mem_leak(memory1, memory2)
    time = 1
    loop do
        if memory1 >= memory2
            if memory1 >= time
                memory1 -= time
            else
                break
            end
        else
            if memory2 >= time
                memory2 -= time
            else
                break
            end
        end
        time += 1
    end
    [time, memory1, memory2]
end

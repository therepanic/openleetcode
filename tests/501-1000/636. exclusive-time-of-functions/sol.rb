# @param {Integer} n
# @param {String[]} logs
# @return {Integer[]}
def exclusive_time(n, logs)
    callstack = []
    exectime = Array.new(n, 0)
    
    logs.each do |log|
        idn, status, curtime = log.split(":")
        idn = idn.to_i
        curtime = curtime.to_i
        if status == "start"
            callstack.push([idn, curtime])
        else
            x, y = callstack.pop
            time = curtime - y + 1
            exectime[x] += time
            if !callstack.empty?
                x, _ = callstack.last
                exectime[x] -= time
            end
        end
    end
    
    exectime
end

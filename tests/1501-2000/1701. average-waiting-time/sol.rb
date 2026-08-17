def average_waiting_time(customers)
    waiting = 0
    current = 0
    customers.each do |arrival, time|
        if current <= arrival
            current = arrival + time
            waiting += time
        else
            current += time
            waiting += (current - arrival)
        end
    end
    waiting.to_f / customers.length
end

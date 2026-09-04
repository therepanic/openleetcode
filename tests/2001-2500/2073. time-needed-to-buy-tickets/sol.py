class Solution(object):
    def timeRequiredToBuy(self, tickets, k):
        c=0
        while tickets[k]!=0:
            for i in range(len(tickets)):
                if i==k:
                    tickets[i]-=1
                    c+=1
                    if tickets[k]==0:
                        break
                elif tickets[i]!=0:
                    tickets[i]-=1
                    c+=1
        return c
class Solution:
    class Bank:
        def __init__(self, balance: list[int]):
            self.bal = balance
            self.n = len(balance)

        def valid(self, acc: int) -> bool:
            return 1 <= acc <= self.n

        def transfer(self, account1: int, account2: int, money: int) -> bool:
            if not self.valid(account1) or not self.valid(account2) or self.bal[account1 - 1] < money:
                return False
            self.bal[account1 - 1] -= money
            self.bal[account2 - 1] += money
            return True

        def deposit(self, account: int, money: int) -> bool:
            if not self.valid(account):
                return False
            self.bal[account - 1] += money
            return True

        def withdraw(self, account: int, money: int) -> bool:
            if not self.valid(account) or self.bal[account - 1] < money:
                return False
            self.bal[account - 1] -= money
            return True

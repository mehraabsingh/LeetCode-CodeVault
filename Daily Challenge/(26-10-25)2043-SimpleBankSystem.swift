class Bank {
    var balance: [Int]

    init(_ balance: [Int]) {
        self.balance = balance
    }
    
    func valid(_ account: Int) -> Bool {
        return account >= 1 && account <= balance.count
    }
    
    func transfer(_ account1: Int, _ account2: Int, _ money: Int) -> Bool {
        if !valid(account1) || !valid(account2) || balance[account1 - 1] < money {
            return false
        }
        balance[account1 - 1] -= money
        balance[account2 - 1] += money
        return true
    }
    
    func deposit(_ account: Int, _ money: Int) -> Bool {
        if !valid(account) { return false }
        balance[account - 1] += money
        return true
    }
    
    func withdraw(_ account: Int, _ money: Int) -> Bool {
        if !valid(account) || balance[account - 1] < money {
            return false
        }
        balance[account - 1] -= money
        return true
    }
}

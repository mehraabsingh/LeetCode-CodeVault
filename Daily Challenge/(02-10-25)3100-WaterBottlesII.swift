class Solution {
    func maxBottlesDrunk(_ numBottles: Int, _ numExchange: Int) -> Int {
        var full = numBottles
        var empty = 0
        var exchange = numExchange
        var totalDrunk = 0
        
        while full > 0 {
            // Drink all full bottles
            totalDrunk += full
            empty += full
            full = 0
            
            // Try to exchange
            if empty >= exchange {
                empty -= exchange
                full += 1
                exchange += 1
            } else {
                break
            }
        }
        
        return totalDrunk
    }
}

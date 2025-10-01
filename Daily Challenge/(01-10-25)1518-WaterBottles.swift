class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var total = numBottles
        var empty = numBottles
        
        while empty >= numExchange {
            let newBottles = empty / numExchange
            total += newBottles
            empty = empty % numExchange + newBottles
        }
        
        return total
    }
}

class Solution {
    func totalMoney(_ n: Int) -> Int {
        let weeks = n / 7
        let days = n % 7
        let fullWeeksSum = 7 * weeks * (weeks + 7) / 2
        let remainingDaysSum = days * (2 * weeks + days + 1) / 2
        return fullWeeksSum + remainingDaysSum
    }
}

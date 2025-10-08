class Solution {
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        let sortedPotions = potions.sorted()
        var result = [Int]()
        
        for spell in spells {
            // Minimum potion strength required for success
            let required = Double(success) / Double(spell)
            
            // Binary search in sorted potions
            var left = 0
            var right = sortedPotions.count - 1
            var index = sortedPotions.count  // assume no valid potion
            
            while left <= right {
                let mid = (left + right) / 2
                if Double(sortedPotions[mid]) >= required {
                    index = mid
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            
            // Count of potions forming successful pairs
            let count = sortedPotions.count - index
            result.append(count)
        }
        
        return result
    }
}

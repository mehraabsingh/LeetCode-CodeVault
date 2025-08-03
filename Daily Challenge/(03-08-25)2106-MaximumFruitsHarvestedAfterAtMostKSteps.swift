class Solution {
    func maxTotalFruits(_ fruits: [[Int]], _ startPos: Int, _ k: Int) -> Int {
        var maxFruits = 0
        var left = 0
        var currentSum = 0
        let n = fruits.count
        
        for right in 0..<n {
            currentSum += fruits[right][1]
            
            while left <= right {
                let leftPos = fruits[left][0]
                let rightPos = fruits[right][0]
                
                // Steps if go left first or right first
                let minSteps = min(
                    abs(startPos - leftPos) + (rightPos - leftPos),
                    abs(startPos - rightPos) + (rightPos - leftPos)
                )
                
                if minSteps <= k {
                    break
                }
                // Window is too far, shrink it
                currentSum -= fruits[left][1]
                left += 1
            }
            
            maxFruits = max(maxFruits, currentSum)
        }
        
        return maxFruits
    }
}

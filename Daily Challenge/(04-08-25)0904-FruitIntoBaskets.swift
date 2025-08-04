class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        var left = 0
        var maxFruits = 0
        var basket: [Int: Int] = [:]  // Dictionary to count fruit types in the window

        for right in 0..<fruits.count {
            basket[fruits[right], default: 0] += 1

            // If we have more than 2 types of fruits, shrink the window from the left
            while basket.keys.count > 2 {
                basket[fruits[left]]! -= 1
                if basket[fruits[left]]! == 0 {
                    basket.removeValue(forKey: fruits[left])
                }
                left += 1
            }

            // Update maxFruits if the current window is larger
            maxFruits = max(maxFruits, right - left + 1)
        }

        return maxFruits
    }
}

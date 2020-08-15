# Coin Change 2
# 零钱兑换 II


## Description
You are given coins of different denominations and a total amount of money. Write a function to compute the number of combinations that make up that amount. You may assume that you have infinite number of each kind of coin.

## Description
给定不同面额的硬币和一个总金额。写出函数来计算可以凑成总金额的硬币组合数。假设每一种面额的硬币有无限个。 




## Example
### Example 1:
Input: amount = 5, coins = [1, 2, 5]
Output: 4
Explanation: there are four ways to make up the amount:
5=5
5=2+2+1
5=2+1+1+1
5=1+1+1+1+1

### Example 2:
Input: amount = 3, coins = [2]
Output: 0
Explanation: the amount of 3 cannot be made up just with coins of 2.

### Example 3:
Input: amount = 10, coins = [10] 
Output: 1

## 示例
### 示例 1:
    输入: amount = 5, coins = [1, 2, 5]
    输出: 4
    解释: 有四种方式可以凑成总金额:
    5=5
    5=2+2+1
    5=2+1+1+1
    5=1+1+1+1+1

### 示例 2:
    输入: amount = 3, coins = [2]
    输出: 0
    解释: 只用面额2的硬币不能凑成总金额3。

### 示例 3:
    输入: amount = 10, coins = [10] 
    输出: 1



### Note:
You can assume that
* 0 <= amount <= 5000
* 1 <= coin <= 5000
* the number of coins is less than 500
* the answer is guaranteed to fit into signed 32-bit integer

## 注意
   你可以假设：
   * 0 <= amount (总金额) <= 5000
   * 1 <= coin (硬币面额) <= 5000
   * 硬币种类不超过 500 种
   * 结果符合 32 位符号整数



## Solution
### 动态规划
这道题目我们可以参考的上一道题目的思路, 不过这里为了避免重复的情况, 我们分别遍历每枚硬币的情况, 再根据这里的状态转移公式dp[i]=dp[i]+dp[i-c]的情况来更新

### Code

```java
    //T O(Sn)
    //S O(S)
    public int change(int amount, int[] coins) {
        //定义dp数组
        int[] dp = new int[amount + 1];

        dp[0] = 1;

        //依次尝试加入每个硬币的信息
        for (int coin: coins){
            //针对不同的价格更新组合的情况
            for (int i = coin; i < amount + 1 ; i++) {
                dp[i] += dp[i - coin];
            }
        }

        return dp[amount];
    }
```
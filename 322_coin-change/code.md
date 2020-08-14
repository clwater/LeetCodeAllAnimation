# Coin Change
# 零钱兑换


## Description
You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.


## Description
给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。


## Example
### Example 1:
    Input: coins = [1, 2, 5], amount = 11
    Output: 3 
    Explanation: 11 = 5 + 5 + 1

### Example 2:
    Input: coins = [2], amount = 3
    Output: -1

## 示例
### 示例 1:
    输入: coins = [1, 2, 5], amount = 11
    输出: 3 
    解释: 11 = 5 + 5 + 1

### 示例 2:
    输入: coins = [2], amount = 3
    输出: -1


### Note:
You may assume that you have an infinite number of each kind of coin.

## 提示
你可以认为每种硬币的数量是无限的。


## Solution
### 动态规划
虽然这道题目我们可以使用回溯遍历的方法来实现, 不过在性能上显然是达不到我们要求的, 再结合题目要求的这样的动态变化的状况, 我们可以使用动态规划了解决

### Code

```java
  //T O(Sn)
    //S O(S)
    public int coinChange(int[] coins, int amount) {
        //定义dp数组,
        //dp[i]表示当目标数量为i时, 使用硬币最少的数量
        int[] dp = new int[amount + 1];
        //dp默认填充为amount+1, 方便后面比较统计
        Arrays.fill(dp, amount + 1);
        //dp[0]的值默认为0
        dp[0] = 0;

        //从目标期望为1的开始, 寻找当前目标值硬币数量最少的情况
        for (int i = 1; i <= amount; i++) {
            //依次比较dp[i]和dp[i-coin] + 1比较小的值
            for (int coin : coins) {
                if (coin <= i) {
                    dp[i] = Math.min(dp[i], dp[i - coin] + 1);
                }
            }
        }

        //如果存在解的话返回dp数组中最后值的情况
        return dp[amount] > amount ? -1 : dp[amount];
    }
```
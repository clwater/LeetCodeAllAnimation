# Best Time to Buy and Sell Stock with Cooldown
# 最佳买卖股票时机含冷冻期


## Description
Say you have an array for which the ith element is the price of a given stock on day i.

Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:

You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)


## Description
给定一个整数数组，其中第 i 个元素代表了第 i 天的股票价格 。​

设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:

你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。


## Example
### Example:
    Input: [1,2,3,0,2]
    Output: 3 
    Explanation: transactions = [buy, sell, cooldown, buy, sell]


## 示例
### 示例:
    输入: [1,2,3,0,2]
    输出: 3 
    解释: 对应的交易状态为: [买入, 卖出, 冷冻期, 买入, 卖出]



## Solution
### 动态规划
这仍然是一道股票买卖相关的题目, 这里我们采用动态规划的方式来解决, 这里需要注意到我们的状态是有三种, 我们需要注意不同状态的转换

### Code

```java
    //T O(n)
    //S O(n)
    public int maxProfit(int[] prices) {
        int N = prices.length;
        //特殊化处理
        if (N < 2) {
            return 0;
        }
        //定义dp数组
        //dp[i][j]表示为i这一天状态为j时的最大收益
        //0 不持股且能购买
        //1 持股
        //2 不持股且不能购买(冷冻期)
        int[][] dp = new int[N][3];

        // 初始化
        dp[0][0] = 0;
        dp[0][1] = -prices[0];
        dp[0][2] = 0;

        for (int i = 1; i < N; i++) {
            //不持股且能购买：
            //  昨天不持股, 今天不操作, 仍然不持股
            //  昨天持股,今天卖出
            dp[i][0] = Math.max(dp[i - 1][0], dp[i - 1][1] + prices[i]);
            //持股：
            //  昨天持股, 今天不操作, 仍然持股
            //  昨天处在冷冻期, 今天买了一股
            dp[i][1] = Math.max(dp[i - 1][1], dp[i - 1][2] - prices[i]);
            //在冷冻期只可以由不持股转换而来
            dp[i][2] = dp[i - 1][0];
        }
        //获取不持股和冷冻期的最大者为结果
        return Math.max(dp[N - 1][0], dp[N - 1][2]);
    }
```
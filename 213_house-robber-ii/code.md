# House Robber II
# 打家劫舍

## Description
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

## Description
你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。这个地方所有的房屋都围成一圈，这意味着第一个房屋和最后一个房屋是紧挨着的。同时，相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。

## Example
### Example 1:
    Input: [2,3,2]
    Output: 3
    Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2),
                 because they are adjacent houses.

### Example 2:
    Input: [1,2,3,1]
    Output: 4
    Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
                 Total amount you can rob = 1 + 3 = 4.

## 示例
### 示例 1:
    输入: [2,3,2]
    输出: 3
    解释: 你不能先偷窃 1 号房屋（金额 = 2），然后偷窃 3 号房屋（金额 = 2）, 因为他们是相邻的。

### 示例 2:
    输入: [1,2,3,1]
    输出: 4
    解释: 你可以先偷窃 1 号房屋（金额 = 1），然后偷窃 3 号房屋（金额 = 3）。
         偷窃到的最高金额 = 1 + 3 = 4 。

## Solution
### 动态规划
这里依然是上一道题目的进阶问题, 这里不一样的地方是我们首尾是相连的, 所以我们可以再上一个问题的基础上进行优化, 只要多循环一个新的范围即可.


## Code 

```java
    //T O(n)
    //S O(n)
    public int rob(int[] nums) {
        //特殊值判断
        if (nums == null || nums.length == 0) {
            return 0;
        }

        //获取当前数组长度
        //如果当前人家数少于等于2个, 则选择其中更幸运的那家
        int length = nums.length;
        if (length <= 2) {
            return (length == 2) ? Math.max(nums[0], nums[1]) : nums[0];
        }


        //定义2个dp数组
        //因为实际上每个屋子的总金额之和前两个屋子有关, 所以可以通过移动数组更新前两个屋子的总金额, 使得S为O(1)
        int[] dp1 = new int[length];
        int[] dp2 = new int[length];

        //初始化两个dp数组,
        //dp1是计算的是[1,n]
        //dp2计算的是[0,n-1]
        dp1[0] = 0;
        dp1[1] = nums[1];
        dp2[0] = nums[0];
        dp2[1] = Math.max(nums[0], nums[1]);

        //按照 打家劫舍 I 的转移解答执行两遍
        //状态转移方程为 dp[i] = max(dp[i - 1], dp[i - 2] + num[i])
        for (int i = 2; i < length; i++) {
            dp1[i] = Math.max(dp1[i - 1], dp1[i - 2] + nums[i]);
        }
        for (int i = 2; i < length - 1; i++) {
            dp2[i] = Math.max(dp2[i - 1], dp2[i - 2] + nums[i]);
        }

        for (int i = 0; i < length; i++) {
            System.out.print(" " + dp1[i]);
        }
        System.out.println(" ");

        for (int i = 0; i < length; i++) {
            System.out.print(" " + dp2[i]);
        }
        System.out.println(" ");

        return Math.max(dp1[length - 1], dp2[length - 2]);
    }
```
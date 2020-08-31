# Burst Balloons
# 戳气球

## Description
Given n balloons, indexed from 0 to n-1. Each balloon is painted with a number on it represented by array nums. You are asked to burst all the balloons. If the you burst balloon i you will get nums[left] * nums[i] * nums[right] coins. Here left and right are adjacent indices of i. After the burst, the left and right then becomes adjacent.

Find the maximum coins you can collect by bursting the balloons wisely.


## Description
有 n 个气球，编号为0 到 n-1，每个气球上都标有一个数字，这些数字存在数组 nums 中。
现在要求你戳破所有的气球。如果你戳破气球 i ，就可以获得 nums[left] * nums[i] * nums[right] 个硬币。 这里的 left 和 right 代表和 i 相邻的两个气球的序号。注意当你戳破了气球 i 后，气球 left 和气球 right 就变成了相邻的气球。
求所能获得硬币的最大数量。

## Example
### Example
     Input: [3,1,5,8]
     Output: 167 
     Explanation: nums = [3,1,5,8] --> [3,5,8] -->   [3,8]   -->  [8]  --> []
                  coins =  3*1*5      +  3*5*8    +  1*3*8      + 1*8*1   = 167


## 示例
### 示例:
    输入: [3,1,5,8]
    输出: 167 
    解释: nums = [3,1,5,8] --> [3,5,8] -->   [3,8]   -->  [8]  --> []
         coins =  3*1*5      +  3*5*8    +  1*3*8      + 1*8*1   = 167

## Other
### Note
* You may imagine nums[-1] = nums[n] = 1. They are not real therefore you can not burst them.
* 0 ≤ n ≤ 500, 0 ≤ nums[i] ≤ 100


## 其它
### 说明:
* 你可以假设 nums[-1] = nums[n] = 1，但注意它们不是真实存在的所以并不能被戳破。
* 0 ≤ n ≤ 500, 0 ≤ nums[i] ≤ 100


## Solution
### 记忆化搜索+dfs
我们观察戳气球的操作,发现这会导致两个气球从不相邻变成相邻, 使得后续操作难以处理. 于是我们倒过来看这些操作, 将全过程看作是每次添加一个气球

## Code 

```java
     //result[left][right]表示在left到right区间内最大评分
    //避免重复计算
    public int[][] result;
    //优化nums数组
    private int[] helper;

    //T O(n^3)
    //S O(n^2)
    public int maxCoins(int[] nums) {
        //优化nums数组, 将其左右两侧增加评分为1的气球, 方便后面计算
        int n = nums.length;
        helper = new int[n + 2];

        for (int i = 1; i <= n; i++) {
            helper[i] = nums[i - 1];
        }

        //左右两侧特殊气球
        helper[0] = 1;
        helper[n + 1] = 1;

        result = new int[n + 2][n + 2];

        //默认填充所有情况均为计算
        for (int i = 0; i <= n + 1; i++) {
            Arrays.fill(result[i], -1);
        }

        //依次处理获取结果情况
        return solve(0, n + 1);
    }

    private int solve(int left, int right) {
        //递归结束判断
        if (left >= right - 1) {
            return 0;
        }

        //如果当前情况计算过, 则无需重复计算
        if (result[left][right] != -1) {
            return result[left][right];
        }

        //计算在left到right的区间内
        //最后移除不同位置时评分的情况
        for (int i = left + 1; i < right; i++) {
            //计算移除当前位置时的评分
            int sum = helper[left] * helper[i] * helper[right];
            sum += solve(left, i) + solve(i, right);

            //更新left到right区间内评分最大和情况
            result[left][right] = Math.max(result[left][right], sum);
        }

        return result[left][right];
    }

```
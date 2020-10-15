# Maximum Subarray
# 最大子序和

## Description
Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

## Description
给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

## Example
### Example:
    Input: [-2,1,-3,4,-1,2,1,-5,4],
    Output: 6
    Explanation: [4,-1,2,1] has the largest sum = 6.

## 示例
### 示例:
    输入: [-2,1,-3,4,-1,2,1,-5,4]
    输出: 6
    解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。

## Other
### Follow up:
* If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.

## 其它
### 进阶:
* 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。


## Solution
### 贪心
这道题目我们使用贪心的方法来解决, 因为最大的和不能是一个负区间为开始, 所以我们这里寻找前区间和为正数的区间进行比对处理.


## Code 

```java
    //T O(n)
    //S O(1)
    public int maxSubArray(int[] nums) {
        //定义返回结果
        int result = nums[0];

        //定义当前位置前一个区间的和
        int sum = 0;

        for (int i = 0 ; i < nums.length ; i++){
            //如果之前区间和大于0, 则继续加入当前位置的值
            if (sum > 0){
                sum += nums[i];
            //如果发现之前的区间和不大于0,
            //则将当前位置设置为新的区间的开始
            }else {
                sum = nums[i];
            }

            //比较下最新的区间和与之前最大的区间和的情况
            result = Math.max(sum, result);
        }

        return result;
    }
```
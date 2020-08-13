# Sum of Mutated Array Closest to Target
# 转变数组后最接近目标值的数组和


## Description
Given an integer array arr and a target value target, return the integer value such that when we change all the integers larger than value in the given array to be equal to value, the sum of the array gets as close as possible (in absolute difference) to target.

In case of a tie, return the minimum such integer.

Notice that the answer is not neccesarilly a number from arr.


## Description
给你一个整数数组 arr 和一个目标值 target ，请你返回一个整数 value ，使得将数组中所有大于 value 的值变成 value 后，数组的和最接近  target （最接近表示两者之差的绝对值最小）。

如果有多种使得和最接近 target 的方案，请你返回这些整数中的最小值。

请注意，答案不一定是 arr 中的数字。


## Example
### Example 1:
    Input: arr = [4,9,3], target = 10
    Output: 3
    Explanation: When using 3 arr converts to [3, 3, 3] which sums 9 and that's the optimal answer.

### Example 2:
    Input: arr = [2,3,5], target = 10
    Output: 5

### Example 3:
    Input: arr = [60864,25176,27249,21296,20204], target = 56803
    Output: 11361

## 示例
### 示例 1：
    输入：arr = [4,9,3], target = 10
    输出：3
    解释：当选择 value 为 3 时，数组会变成 [3, 3, 3]，和为 9 ，这是最接近 target 的方案。

### 示例 2：
    输入：arr = [2,3,5], target = 10
    输出：5

### 示例 3：
    输入：arr = [60864,25176,27249,21296,20204], target = 56803
    输出：11361


### Note:
* 1 <= arr.length <= 10^4
* 1 <= arr[i], target <= 10^5

## 提示
* 1 <= arr.length <= 10^4
* 1 <= arr[i], target <= 10^5


## Solution
### 前缀和
当我们在尝试解答的时候, 我们会发现序列的sum和为一个单调递增的凸函数, 所以我们只要找到收个大于target的取值, 再对他进行处理就可以了

### Code

```java
    //T O(n*log(n))
    //S O(1)
    public int findBestValue(int[] arr, int target) {
        //排序数组
        Arrays.sort(arr);
        //前i项的前缀和
        int pre = 0;
        //剩余数字的数量
        int k = arr.length;

        //遍历数组
        for (int a : arr) {
            //计算前i项的和与 后k项都变成a的值的和
            int sum = pre + a * k;
            //如果此时的变化的值和不小于target, 则说明到达了取值的边界
            if (sum >= target) {
                //寻找经过四舍五入后范围内最小的取值
                return a -
                        Math.round( (sum - target) / 1.0f / k);
            }
            //更新前i项的前缀和
            pre += a;
            //更新剩余数字的数量
            --k;
        }
        //如果循环内没有找到大于target的值, 则取arr中最大的值为结果
        return arr[arr.length - 1];
    }
```
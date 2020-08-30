# Next Permutation
# 下一个排列

## Description
Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
The replacement must be in-place and use only constant extra memory.


## Description
实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
必须原地修改，只允许使用额外常数空间。


## Example
Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1

## 示例
以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
1,2,3 → 1,3,2
3,2,1 → 1,2,3
1,1,5 → 1,5,1



## Solution
### 循环扫描
这道题目的难度在于我们如何寻找到下一个刚好大于的数字, 这里的话我们可以尝试在折线图中找到相关的结果


## Code 

```java
//T O(n)
    //S O(1)
    public void nextPermutation(int[] nums) {
        //第一部分
        //从后向前寻找升序的情况
        int i = nums.length - 2;
        while (i >= 0 && nums[i + 1] <= nums[i]) {
            i--;
        }

        //第二部分
        //从后向前寻找第一个大于当前分界值的位置并替换
        if (i >= 0) {
            int j = nums.length - 1;
            while (j >= 0 && nums[j] <= nums[i]) {
                j--;
            }
            swap(nums, i, j);
        }

        //第三部分
        //升序排序剩下数组元素
        reverse(nums, i + 1);
    }

    //交换剩下数组
    //剩下的原为降序排列, 依次交换后变为升序
    private void reverse(int[] nums, int start) {
        int i = start, j = nums.length - 1;
        while (i < j) {
            swap(nums, i, j);
            i++;
            j--;
        }
    }

    //交换数组中某两位元素
    private void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
```
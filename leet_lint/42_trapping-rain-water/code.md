# Trapping Rain Water
# 接雨水

## Description
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!

## Description
给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢 Marcos 贡献此图。

## Example
### Example:
    Input: [0,1,0,2,1,0,1,3,2,1,2,1]
    Output: 6

## 示例
### 示例:
    输入: [0,1,0,2,1,0,1,3,2,1,2,1]
    输出: 6


## Solution
### 栈
用栈来跟踪可能储水的最长的条形块, 在遍历的过程中找到做大的情况


## Code 

```java
//T O(n)
    //S O(n)
    public int trap(int[] height) {
        //结果集
        int result = 0;
        //辅助栈
        Stack<Integer> stack = new Stack<>();
        //当前操作位置
        int current = 0;
        while (current < height.length) {

            //栈不空并且当前指向的高度大于栈顶高度
            while (!stack.empty() && height[current] > height[stack.peek()]) {
                //记录出栈的元素带高度
                int h = height[stack.peek()];
                //出栈
                stack.pop();
                //栈空则停止
                if (stack.empty()) {
                    break;
                }
                //计算两墙之前的距离
                int distance = current - stack.peek() - 1;
                //获取两墙较小的高度
                int min = Math.min(height[stack.peek()], height[current]);
                //计算承接雨水的数量
                result = result + distance * (min - h);
            }
            //当前指向的墙入栈
            stack.push(current);
            //移动指针
            current++;
        }
        return result;
    }
```
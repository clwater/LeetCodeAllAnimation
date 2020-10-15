# Rectangle Overlap
# 矩形重叠

## Description
A rectangle is represented as a list [x1, y1, x2, y2], where (x1, y1) are the coordinates of its bottom-left corner, and (x2, y2) are the coordinates of its top-right corner.
Two rectangles overlap if the area of their intersection is positive.  To be clear, two rectangles that only touch at the corner or edges do not overlap.
Given two (axis-aligned) rectangles, return whether they overlap.

## Description
矩形以列表 [x1, y1, x2, y2] 的形式表示，其中 (x1, y1) 为左下角的坐标，(x2, y2) 是右上角的坐标。
如果相交的面积为正，则称两矩形重叠。需要明确的是，只在角或边接触的两个矩形不构成重叠。
给出两个矩形，判断它们是否重叠并返回结果。

## Example
### Example 1:
    Input: rec1 = [0,0,2,2], rec2 = [1,1,3,3]
    Output: true

### Example 2:
    Input: rec1 = [0,0,1,1], rec2 = [1,0,2,1]
    Output: false

## 示例
###   示例 1：
    输入：rec1 = [0,0,2,2], rec2 = [1,1,3,3]
    输出：true

### 示例 2：
    输入：rec1 = [0,0,1,1], rec2 = [1,0,2,1]
    输出：false

## Other
### Notes:
* Both rectangles rec1 and rec2 are lists of 4 integers.
* All coordinates in rectangles will be between -10^9 and 10^9.

## 提示
### 提示：
* 两个矩形 rec1 和 rec2 都以含有四个整数的列表的形式给出。
* 矩形中的所有坐标都处于 -10^9 和 10^9 之间。
* x 轴默认指向右，y 轴默认指向上。
* 你可以仅考虑矩形是正放的情况。


## Solution
### 检查位置+投影检查
在检查位置的思路下,我们尝试分析在什么情况下,矩形rec1和rec2没有重叠.其次我们还可以通过投影的思路来解决.


## Code 

```java
    //检查位置
    //T O(1)
    //S O(1)
    public boolean isRectangleOverlap(int[] rec1, int[] rec2) {
        return !(rec1[2] <= rec2[0] ||   // left一 右上在二左下左
                rec1[3] <= rec2[1] ||   // bottom一 右上 再二左下下
                rec1[0] >= rec2[2] ||   // right一 左下再二右上右
                rec1[1] >= rec2[3]);    // top一 左下再二右上上
    }

    //投影检查
    //T O(1)
    //S O(1)
    public boolean isRectangleOverlap(int[] rec1, int[] rec2) {
        return Math.max(rec1[0], rec2[0]) < Math.min(rec1[2], rec2[2])  &&
                Math.max(rec1[1], rec2[1]) < Math.min(rec1[3], rec2[3]) ;
    }
```
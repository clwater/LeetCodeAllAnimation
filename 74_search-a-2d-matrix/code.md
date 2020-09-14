# Search a 2D Matrix
# 搜索二维矩阵

## Description
Write an efficient algorithm that searches for a value in an m x n matrix.
This matrix has the following properties:
* Integers in each row are sorted from left to right.
The first integer of each row is greater than the last 
* integer of the previous row.

## Description
写出一个高效的算法来搜索 m × n矩阵中的值。
这个矩阵具有以下特性：
* 每行中的整数从左到右是排序的。
* 每行的第一个数大于上一行的最后一个整数。


## Example
### Example 1:
    Input:  [[5]],2
	Output: false
	
	Explanation: 
	false if not included.

### Example 2:
    Input:  [
        [1, 3, 5, 7],
        [10, 11, 16, 20],
        [23, 30, 34, 50]
    ],3
        Output: true
        
        Explanation: 
        return true if included.


## 样例
### 样例  1:
	输入: [[5]],2
	输出: false
	
	样例解释: 
    没有包含，返回false。

### 样例 2:
	输入:  
    [
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
    ],3
        输出: true
        
        样例解释: 
        包含则返回true。        

## Solution

### 二分法
这道题目可以将现有的二维数组转化为一维数组, 根据题目的给定的条件, 可以看到这个一维数组是一个有序的数组, 所以我们可以通过二分法来快速搜索某个元素是否存在,这里我们需要注意在这个二维数组中如何和一维数组相关的位置进行匹配.         

### Code

```java
    //T O(log(mn))
    //S O(1)
    public boolean searchMatrix(int[][] matrix, int target) {
        //获取数组的边界情况
        //特殊情况处理
        int row = matrix.length;
        if (row == 0) {
            return false;
        }
        int col = matrix[0].length;

        //计算左右边界
        int left = 0, right = row * col - 1;

        //二分查找目标是否存在
        while (left <= right)
        {
            //计算中间值
            int mid = left + ((right - left) / 2);
            //更新左右区间
            if (matrix[mid / col][mid % col] > target) {
                right = mid - 1;
            } else if (matrix[mid / col][mid % col] < target) {
                left = mid + 1;
            } else {
                return true;
            }
        }
        return false;
    }
```
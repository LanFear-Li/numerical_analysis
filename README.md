# numerical_analysis
数值计算方法 matlab实现

# 介绍
包含《数值计算方法与实习》书中给出的算法的Matlab实现
欢迎完善

# 已完成部分
## 一、solving_linear_system：线性方程组的数值解法
1、lu_decomposition.m：普通LU分解（不带列主元）

2、plu_decomposition.m：带列主元的LU分解，PA=LU

3、lu_symmetrical_positive_definite.m：对于对称正定矩阵的LU分解（改进平方根法）

4、solve_upper_triangular_matrix.m：求解上三角矩阵对应的线性方程组解

5、solve_by_iterative_method.m：矩阵迭代法求解线性方程组

6、get_jacobi_matrix.m：获取Jacobi迭代矩阵

7、get_gauss_seidel_matrix.m：获取Gauss-Seidel迭代矩阵

8、thomas_algorithm.m：追赶法求解三对角矩阵

## 二、interpolation：插值算法
1、lagrange_interpolation.m：拉格朗日插值法

2、newton_divided_difference.m：获取牛顿差商矩阵

3、newton_interpolation.m：牛顿插值法

4、piecewise_linear_interpolation.m：分段线性插值法

5、hermite_interpolation.m：分段三次埃尔米特插值法

6、get_pchip_derivative.m：获取PCHIP插值导数

7、pchip_interpolation.m：PCHIP插值（对hermite_interpolation、get_pchip_derivative的包装）

## 三、least_square：最小二乘法
1、projection_least_square.m：（教科书上常见的）列空间投影求最小二乘解，数值稳定性差

2、get_householder_matrix.m：获取豪斯赫尔德反射矩阵，将一个向量反射到一个坐标轴上

3、qr_decomposition.m：借助豪斯赫尔德反射矩阵对矩阵进行QR分解

4、qr_least_square.m：借助QR分解实现数值稳定性好的最小二乘法

## 四、curve_fitting：曲线拟合
1、generate_curve_scatter.m：围绕给定曲线生成一系列位置扰动后的散点。用于初步测试曲线拟合效果

## 五、demo：一些演示
1、runge.m：龙格现象演示

7.9
https://blog.csdn.net/qq_42116038/article/details/111204879
#---------------------------------------卸载protoc:
which protoc 
rm /usr/local/bin/protoc

#-----------------------------------安装protoc:
https://github.com/protocolbuffers/protobuf.git
./autogen.sh
./configure
make
make check
sudo make install
sudo ldconfig # refresh shared library cache.s

  sudo rosdep init//这一步会提示已经有这个文件了，可以跳过
  rosdep update
  rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} - 
       
sudo cp /usr/local/bin/protoc /usr/bin

#---------------------------------查看Eigen版本：
sudo gedit /usr/include/eigen3/Eigen/src/Core/util/Macros.h

#----------------------------------------安装cartographer
https://blog.csdn.net/weixin_44684139/article/details/104708387?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522164878411116780264095899%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=164878411116780264095899&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~top_positive~default-1-104708387.142^v5^control&utm_term=cartographer%E5%AE%89%E8%A3%85&spm=1018.2226.3001.4187

https://blog.csdn.net/charyman/article/details/121300545?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522164878411116780264095899%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=164878411116780264095899&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~top_positive~default-2-121300545.142^v5^control&utm_term=cartographer%E5%AE%89%E8%A3%85&spm=1018.2226.3001.4187

https://blog.csdn.net/weixin_39458342/article/details/103276265?ops_request_misc=&request_id=&biz_id=102&utm_term=cartographer%E5%AE%89%E8%A3%85&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduweb~default-2-103276265.142^v5^control&spm=1018.2226.3001.4187


#----------------------------cartographer 编译
catkin_make_isolated --install --use-ninja
source install_isolated/setup.bash

#----------------------------------------2D测试
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=/home/hyf/download/others/b0-2014-07-11-10-58-16.bag


#-------------------缺少包   如：moveit_ros_planning_interfaceConfig.cmake

sudo apt-get install ros-melodic-moveit-ros-planning-interface
sudo apt-get install ros-melodic-cartographer


#---------------------------------------------安装到系统

mkdir build 
cd build 
cmake ..
make 
sudo make install

#--------------------------------------------------------查询的tf_tree
rosrun rqt_tf_tree rqt_tf_tree
rosrun tf tf_echo base_link odom   #把特定的坐标系之间的平移旋转关系，打印到终端控制台

#---------------------------------------------------------查询rqt
rqt_graph

rosrun rqt_plot rqt_plot
rqt_plot /odom/pose/pose/position/x:y:z   #创建图表

#---------------------------------------------------------建立工作空间
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace 		#初始化文件夹
cd ~/catkin_ws/
catkin_make

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc  #设置环境变量
source ~/.bashrc    #执行环境变量
echo $ROS_PACKAGE_PATH   #查看环境变量

cd ~/catkin_ws/src/	#创建功能包
catkin_create_pkg learning_communication std_msgs roscpp rospy
cd ~/catkin_ws
catkin_make

###-------------------------------------------------------postggres
sudo su postgres   
psql -d postgres -U postgres
\list
\c sde
\d      #查看已导入的表数据
drop table reference_linkpoints_st;   #删除表格
\du  #查看所有用户及权限



#-------------------------------------------------------------安装postgresql

  #查看ubuntu版本信息
  lsb_release -a
  
  #查看当前支持的postgresql版本
  sudo apt-cache search postgresql 
  
  #安装postgresql-10
  sudo apt-get install postgresql-10 postgresql-contrib
  
  #查看apt-get库中的软件版本
  sudo apt-cache search postgis
  
  #安装postgis
  sudo apt-get install postgis


#-------------------------------------------------------------cmake
#1
g++ helloSLAM.cpp    
./a.out     #可执行文件

g++ -o run 1.cpp 2.cpp
./run

#2
可使用makefile进行自动编译；cmake管理源代码。

使用 cmake 命令生成几个 makefile 文件；
再使用这个 make 命令，根据这个makefile文件的内容编译整个工程。

camke .      #对该工程进行分析
make    


 1.  编写 CMake 配置文件 CMakeLists.txt 。
 2.  执行命令 cmake PATH 或者 ccmake PATH 生成 Makefile。其中， PATH 是 CMakeLists.txt 所在的目录。
 3.  使用 make 命令进行编译。


























# Dense Visual Odometry and SLAM (dvo_slam)

*NOTE: this is an alpha release APIs and parameters are going to change in near future. No support is provided at this point.*

These packages provide an implementation of the rigid body motion estimation of an RGB-D camera from consecutive images.

 *  **dvo_core**
    
    Core implementation of the motion estimation algorithm. 
    
 *  **dvo_ros**
    
    Integration of *dvo_core* with ROS.
    
 *  **dvo_slam**
    
    Pose graph SLAM system based on *dvo_core* and integration with ROS.
    
 *  **dvo_benchmark**
    
    Integration of *dvo_slam* with TUM RGB-D benchmark, see http://vision.in.tum.de/data/datasets/rgbd-dataset.
    
 *  **sophus**
    
    ROS package wrapper for Hauke Strasdat's Sophus library, see https://github.com/strasdat/Sophus.
    
## Usage

You can use my docker image
```bash
docker pull optsolution/dvo_slam
```
---

You need mount your data to docker container, you can download TUM data from [here](https://vision.in.tum.de/data/datasets/rgbd-dataset/download)

Before the next step, you need get the `assoc.txt` file by run:
```bash
python2 associate.py rgb.txt depth.txt >> assoc.txt
```
Then, you can run
```bash
docker run -i -t -p 5900:5900 -v [data_path]:[docker_data_path] optsolution/dvo_slam
```
e.g.
```bash
docker run -i -t -p 5900:5900 -v /home/cwang/data/TUM/rgbd_dataset_freiburg1_360:/root/dataset optsolution/dvo_slam
```
*option*: input `:5900` in vnc viewer to connect the desktop

---

you can run in the container:
```bash
cd [docker_data_path]
roslaunch dvo_benchmark benchmark.launch
```
e.g.
```bash
cd /root/dataset/
roslaunch dvo_benchmark benchmark.launch
```
Then the camera trajectory will be estimated from an RGB-D image stream.   

After all, you will find the result in `/root/fuerte_workspace/dvo_slam/dvo_benchmark/output`

*TODO*

 - Fix visualization


## Publications

The following publications describe the approach:

 *   **Dense Visual SLAM for RGB-D Cameras** (C. Kerl, J. Sturm, D. Cremers), In Proc. of the Int. Conf. on Intelligent Robot Systems (IROS), 2013.
 *   **Robust Odometry Estimation for RGB-D Cameras** (C. Kerl, J. Sturm, D. Cremers), In Proc. of the IEEE Int. Conf. on Robotics and Automation (ICRA), 2013
 *   **Real-Time Visual Odometry from Dense RGB-D Images** (F. Steinbruecker, J. Sturm, D. Cremers), In Workshop on Live Dense Reconstruction with Moving Cameras at the Intl. Conf. on Computer Vision (ICCV), 2011.

## License

The packages *dvo_core*, *dvo_ros*, *dvo_slam*, and *dvo_benchmark* are licensed under the GNU General Public License Version 3 (GPLv3), see http://www.gnu.org/licenses/gpl.html.

The package *sophus* is licensed under the MIT License, see http://opensource.org/licenses/MIT.

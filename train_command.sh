nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/solver.prototxt -weights /home/cad/disk/linux/RenderForCNN-master/caffe_models/render4cnn_3dview.caffemodel > output.log 2>&1 &

#caffe-render-for-cnn-view_prediction
nohup ./tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/solver_angle.prototxt -weights /home/cad/disk/linux/RenderForCNN-master/caffe_models/render4cnn_3dview.caffemodel > output.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/shineng/vp_train/solver_server_fish.prototxt -weights /home/shineng/vp_train/render4cnn_3dview.caffemodel --gpu 0 > output_fish.log 2>&1 &
nohup ./build/tools/caffe train --solver=/home/shineng/vp_train/solver_server_engine.prototxt -snapshot  snapshots_engine_iter_800.solverstate --gpu 1 > output_engine.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/solver.prototxt -snapshot  snapshots_iter_13200.solverstate --gpu 1 > output.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/classify/solver.prototxt -weights /home/cad/disk/linux/RenderForCNN-master/caffe_models/render4cnn_3dview.caffemodel > output.log 2>&1 &
nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/classify/solver.prototxt -snapshot VIEW_CLASSIFY_iter_400.solverstate > output.log 2>&1 &

nohup ./build/tools/caffe test --model=//home/cad/disk/linux/RenderForCNN-master/train/classify/view_classify.prototxt -weights VIEW_CLASSIFY_iter_600.caffemodel -gpu 0 -iterations 300 > output_classify_test.log 2>&1 &g

#vggnet微调
nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/vggnet/solver.prototxt -weights /home/cad/disk/linux/RenderForCNN-master/caffe_models/VGG_ILSVRC_16_layers.caffemodel >   output.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/shineng/vp_train/vggnet/solver.prototxt -weights /home/shineng/vp_train/vggnet/VGG_ILSVRC_16_layers.caffemodel --gpu 0  > output.log 2>&1 &

#测试
nohup ./build/tools/caffe test --model=/home/cad/disk/linux/RenderForCNN-master/train/train_val_sphere1.prototxt -weights snapshots_engine.caffemodel -gpu 0 -iterations 60 > output_engine_test.log 2>&1 &

#caffe-render-for-cnn-view_prediction
nohup ./tools/caffe test --model=/home/cad/disk/linux/RenderForCNN-master/train/train_val_angle.prototxt -weights snapshots_iter_9400.caffemodel -gpu 0 -iterations 120 > output_head_test.log 2>&1 &


nohup ./build/examples/cpp_classification/classification.bin   /home/cad/disk/linux/RenderForCNN-master/train/deploy1.prototxt  /home/cad/disk/linux/RenderForCNN-master/caffe_models/model-tree/snapshots_tree.caffemodel  /home/cad/disk/linux/RenderForCNN-master/train/imagenet_mean.binaryproto   /home/cad/disk/linux/RenderForCNN-master/train/angle_class.txt  /home/cad/disk/linux/RenderForCNN-master/data/tree/img-pca/all_cla.txt > cla_idx.txt 2>&1 1&

nohup ./build/examples/cpp_classification/classification.bin   /home/cad/disk/linux/RenderForCNN-master/train/classify/deploy_view.prototxt   model-classify/VIEW_CLASSIFY_iter_600.caffemodel   /home/cad/disk/linux/RenderForCNN-master/train/imagenet_mean.binaryproto   /home/cad/disk/linux/RenderForCNN-master/train/classify/class.txt   /media/cad/3fafa74e-c460-4512-8fb2-4a08ea3c1ef7/classify/all_cla.txt 2 > cla_res.txt 2>&1 &

#/home/cad/caffe-master
./build/tools/extract_features.bin VIEW_CLASSIFY_iter_600.caffemodel /home/cad/disk/linux/RenderForCNN-master/train/feat_extra/class_val.prototxt fc7-new feat_extra 50 lmdb GPU 0

extract_features-d.bin VIEW_CLASSIFY_iter_400.caffemodel /home/cad/disk/linux/RenderForCNN-master/train/feat_extra/class_val.prototxt fc7-new feat_extra 207 lmdb GPU 0



nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/solver.prototxt -weights /home/cad/disk/linux/RenderForCNN-master/caffe_models/render4cnn_3dview.caffemodel > output.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/cnn-models/AlexNet_cvgj/train.solver -weights /home/cad/disk/linux/cnn-models/AlexNet_cvgj/alexnet_cvgj_iter_320000.caffemodel > output.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/shineng/vp_train/ResNet50_cvgj/train_fish.solver -weights /home/shineng/vp_train/ResNet50_cvgj/resnet50_cvgj_iter_320000.caffemodel --gpu 1 > output_fish.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/shineng/vp_train/resnet_split/train_fish.solver -weights /home/shineng/vp_train/ResNet50_cvgj/resnet50_cvgj_iter_320000.caffemodel --gpu 1 > output_fish.log 2>&1 &

#caffe-render-for-cnn-view_prediction
nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/solver_angle.prototxt -weights /home/cad/disk/linux/RenderForCNN-master/caffe_models/render4cnn_3dview.caffemodel > output.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/cad/disk/linux/RenderForCNN-master/train/regression/solver_angle.prototxt -weights /home/cad/disk/linux/RenderForCNN-master/caffe_models/render4cnn_3dview.caffemodel > output.log 2>&1 &

nohup ./build/tools/caffe train --solver=/home/shineng/vp_train/solver_server_engine.prototxt -weights /home/shineng/vp_train/render4cnn_3dview.caffemodel --gpu 0 > output_engine.log 2>&1 &
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

nohup ./build/tools/caffe test --model=/home/cad/disk/linux/RenderForCNN-master/train/regression/train_val_angle.prototxt -weights snapshots_iter_200.caffemodel -gpu 0 -iterations 20 > output_engine_test.log 2>&1 &

nohup ./build/tools/caffe test --model=/home/cad/disk/linux/RenderForCNN-master/train/resnet/test_sphere.prototxt -weights resnet50_cvgj_engine.caffemodel -gpu 0 -iterations 1687 > output_engine_test.log 2>&1 &

#caffe-render-for-cnn-view_prediction
nohup ./tools/caffe test --model=/home/cad/disk/linux/RenderForCNN-master/train/train_val_angle.prototxt -weights snapshots_iter_9400.caffemodel -gpu 0 -iterations 120 > output_engine_test.log 2>&1 &


nohup ./build/examples/cpp_classification/classification.bin   /home/cad/disk/linux/RenderForCNN-master/train/deploy1.prototxt  /home/cad/disk/linux/RenderForCNN-master/caffe_models/model-engine/snapshots_engine.caffemodel  /home/cad/disk/linux/RenderForCNN-master/train/imagenet_mean.binaryproto   /home/cad/disk/linux/RenderForCNN-master/train/angle_class.txt  /home/cad/disk/linux/simi-based-vp-sel/data/engine-render-512/labels.txt > cla_idx.txt 2>&1 0&

nohup ./build/examples/cpp_classification/classification.bin   /home/cad/disk/linux/RenderForCNN-master/train/classify/deploy_view.prototxt   model-classify/VIEW_CLASSIFY_iter_600.caffemodel   /home/cad/disk/linux/RenderForCNN-master/train/imagenet_mean.binaryproto   /home/cad/disk/linux/RenderForCNN-master/train/classify/class.txt   /media/cad/3fafa74e-c460-4512-8fb2-4a08ea3c1ef7/classify/all_cla.txt 2 > cla_res.txt 2>&1 &

#/home/cad/caffe-master
./build/tools/extract_features.bin VIEW_CLASSIFY_iter_600.caffemodel /home/cad/disk/linux/RenderForCNN-master/train/feat_extra/class_val.prototxt fc7-new feat_extra 50 lmdb GPU 0

./build/tools/extract_features.bin /home/cad/下载/caffe-render-for-cnn/snapshots_iter_800.caffemodel /home/cad/disk/linux/RenderForCNN-master/train/feat_extra/class_val_regression.prototxt fc7 feat_extra 1 lmdb GPU 0

extract_features-d.bin VIEW_CLASSIFY_iter_400.caffemodel /home/cad/disk/linux/RenderForCNN-master/train/feat_extra/class_val.prototxt fc7-new feat_extra 207 lmdb GPU 0



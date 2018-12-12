DATA=/media/cad/0C66F84266F82DD8/tfgan
SAVE_DIR=/media/cad/0C66F84266F82DD8/vp_lmdb/
./build/tools/convert_imageset --shuffle / $SAVE_DIR/train1.txt  $SAVE_DIR/img_train_lmdb 

DATA=/home/shineng/Elements/tfgan
SAVE_DIR=/home/shineng/vp_lmdb/head
nohup ./build/tools/convert_imageset --shuffle / $DATA/labels_head.txt  $SAVE_DIR/img_train_lmdb > makedata_head.log 2>&1 &

DATA=/home/cad/disk/linux/RenderForCNN-master/data/fish/test1
SAVE_DIR=/media/cad/3fafa74e-c460-4512-8fb2-4a08ea3c1ef7/atom
build/tools/convert_imageset  --shuffle / $SAVE_DIR/all_test.txt  $SAVE_DIR/img_test_lmdb

DATA=/home/cad/disk/linux/RenderForCNN-master/data/engine 
SAVE_DIR=/media/cad/Elements/viewpoint
build/tools/convert_imageset --shuffle / $DATA/all_train.txt  $SAVE_DIR/img_exam_lmdb

DATA=/home/cad/disk/linux/RenderForCNN-master/data/engine/reexam1Bord
build/tools/convert_imageset / $DATA/all_test.txt  $DATA/img_test_lmdb

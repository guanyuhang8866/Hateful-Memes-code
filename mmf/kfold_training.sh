export CUDA_VISIBLE_DEVICES=0
export MODEL_NAME=part2_cc_full
for((i=0;i<9;i++));
do

mmf_run \
config=projects/hateful_memes/configs/visual_bert/from_coco.yaml \
env.data_dir=../data/ \
model=visual_bert \
dataset=hateful_memes \
run_type=train_val \
checkpoint.resume_zoo=visual_bert.pretrained.cc.full \
training.max_updates=4000 \
training.num_workers=0 \
training.batch_size=48 \
training.evaluation_interval=500 \
dataset_config.hateful_memes.annotations.train=../data/train_source$i.jsonl \
dataset_config.hateful_memes.annotations.val=../data/dev_source$i.jsonl \
dataset_config.hateful_memes.annotations.test=../data/test_unseen.jsonl \
env.save_dir=./$MODEL_NAME/model$i
rm -r ./$MODEL_NAME/model$i/models/
mmf_predict \
config=projects/hateful_memes/configs/visual_bert/from_coco.yaml \
env.data_dir=../data/ \
dataset_config.hateful_memes.annotations.train=../data/train_source$i.jsonl \
dataset_config.hateful_memes.annotations.val=../data/dev_source$i.jsonl \
dataset_config.hateful_memes.annotations.test=../data/test_unseen.jsonl \
model=visual_bert \
dataset=hateful_memes \
run_type=test \
checkpoint.resume_file=./$MODEL_NAME/model$i/best.ckpt \
checkpoint.resume_pretrained=False \
training.num_workers=0 \
env.save_dir=./$MODEL_NAME/model$i 
python change_order.py --file_path ./$MODEL_NAME/model$i \
--stand_file ./submission_format_phase_2.csv
done
python get_merge.py --file_path ./$MODEL_NAME --num 2000


export MODEL_NAME=part2_cc_small
for((i=0;i<9;i++));
do

mmf_run \
config=projects/hateful_memes/configs/visual_bert/from_coco.yaml \
env.data_dir=../data/ \
model=visual_bert \
dataset=hateful_memes \
run_type=train_val \
checkpoint.resume_zoo=visual_bert.pretrained.cc.small \
training.max_updates=4000 \
training.num_workers=0 \
training.batch_size=48 \
training.evaluation_interval=500 \
dataset_config.hateful_memes.annotations.train=../data/train_source$i.jsonl \
dataset_config.hateful_memes.annotations.val=../data/dev_source$i.jsonl \
dataset_config.hateful_memes.annotations.test=../data/test_unseen.jsonl \
env.save_dir=./$MODEL_NAME/model$i
rm -r ./$MODEL_NAME/model$i/models/
mmf_predict \
config=projects/hateful_memes/configs/visual_bert/from_coco.yaml \
env.data_dir=../data/ \
dataset_config.hateful_memes.annotations.train=../data/train_source$i.jsonl \
dataset_config.hateful_memes.annotations.val=../data/dev_source$i.jsonl \
dataset_config.hateful_memes.annotations.test=../data/test_unseen.jsonl \
model=visual_bert \
dataset=hateful_memes \
run_type=test \
checkpoint.resume_file=./$MODEL_NAME/model$i/best.ckpt \
checkpoint.resume_pretrained=False \
training.num_workers=0 \
env.save_dir=./$MODEL_NAME/model$i
python change_order.py --file_path ./$MODEL_NAME/model$i \
--stand_file ./submission_format_phase_2.csv
done
python get_merge.py --file_path ./$MODEL_NAME --num 2000

export MODEL_NAME=part2_cc_half
for((i=0;i<9;i++));
do

mmf_run \
config=projects/hateful_memes/configs/visual_bert/from_coco.yaml \
env.data_dir=../data/ \
model=visual_bert \
dataset=hateful_memes \
run_type=train_val \
checkpoint.resume_zoo=visual_bert.pretrained.cc.half \
training.max_updates=4000 \
training.num_workers=0 \
training.batch_size=48 \
training.evaluation_interval=500 \
dataset_config.hateful_memes.annotations.train=../data/train_source$i.jsonl \
dataset_config.hateful_memes.annotations.val=../data/dev_source$i.jsonl \
dataset_config.hateful_memes.annotations.test=../data/test_unseen.jsonl \
env.save_dir=./$MODEL_NAME/model$i
rm -r ./$MODEL_NAME/model$i/models/
mmf_predict \
config=projects/hateful_memes/configs/visual_bert/from_coco.yaml \
env.data_dir=../data/ \
dataset_config.hateful_memes.annotations.train=../data/train_source$i.jsonl \
dataset_config.hateful_memes.annotations.val=../data/dev_source$i.jsonl \
dataset_config.hateful_memes.annotations.test=../data/test_unseen.jsonl \
model=visual_bert \
dataset=hateful_memes \
run_type=test \
checkpoint.resume_file=./$MODEL_NAME/model$i/best.ckpt \
checkpoint.resume_pretrained=False \
training.num_workers=0 \
env.save_dir=./$MODEL_NAME/model$i
python change_order.py --file_path ./$MODEL_NAME/model$i \
--stand_file ./submission_format_phase_2.csv
done
python get_merge.py --file_path ./$MODEL_NAME --num 2000
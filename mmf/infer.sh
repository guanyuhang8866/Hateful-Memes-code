export CUDA_VISIBLE_DEVICES=0
export MODEL_NAME=part2_cc_full
for((i=0;i<9;i++));
do
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
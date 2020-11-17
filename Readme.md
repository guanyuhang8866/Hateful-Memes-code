1.First, according to the [instruction document](https://mmf.sh/docs/getting_started/installation/) of MMF environment, build the MMF running environment, The available Python environment I created is like the file 'requirements_of_my_python3.7.9.txt'.

2.Then the MMF tool is used to decompress the data used in the competition.

```
mmf_convert_hm --zip_file=./data/XjiOc5ycDBRRNwbhRlgH.zip --password=EWryfbZyNviilcDF --mmf_data_folder=./data
```

3.Then run the script and divide all the signature data into nine groups according to the idea of cross validation.

```
cd data/data
python kfold_split.py
```

4.Then run the training script to obtain the optimized model and the inference results of the test data.

```
cd -
cd mmf
bash kfold_training.sh
```

5.Then run the fusion script to calculate the mean value of all model inference results to get the final submitted result 'part2_mean_sub.csv'.

```
python mean_method.py
```

###**If you only run the inference model, you need to replace step 4 with the following**

1. Download the model file to code/mmf/

    Model file in [Baidu disk](https://pan.baidu.com/s/1dTHwZLLodKvB7dnlCfJQqQ), password is 'mdfl',Please download three folders and move to code/mmf/.
    
    folder name
    
    ```
    part2_cc_full
    part2_cc_half
    part2_cc_small
   ```

2. Run the model inference script

```
bash infer.sh
```

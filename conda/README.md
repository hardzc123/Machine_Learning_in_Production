'''python

conda create -n my_virtual_enviroment python=3.8
conda env create -f environment.yml
conda create --name new_env_name --clone existing_env_name
conda activate my_virtual_enviroment
conda deactivate
conda env list OR conda info --envs
conda env list | grep -E 'numpy|openai' (The grep -E command option enables Extended Regular Expressions (ERE) in grep)
        grep -E "go+gle" websites.txt
        grep -E "file[0-9]{1,3}" files.txt

conda install package_name
conda remove package_name
conda list
conda search package_name
conda info
conda update conda
conda clean -a (clean cache)

'''


# [Dependencies](https://micro-c.readthedocs.io/en/latest/before_you_begin.html)

```
module load Python/3.8.2-GCCcore-9.3.0
pip install pairtools
pip install deeptools
```

The installed packages are located in `.local/bin` in your home directory. To create symbolic links:
```
cd ~/bin
ln -s ~/.local/bin/pairtools
ln -s ~/.local/bin/deeptools
```

In working directory, download Micro-C and JuicerTools:
```
cd /scratch/yhao/Micro-C
git clone https://github.com/dovetail-genomics/Micro-C.git
wget https://s3.amazonaws.com/hicfiles.tc4ga.com/public/juicer/juicer_tools_1.22.01.jar
mv juicer_tools_1.22.01.jar ./Micro-C/juicertools.jar
```

Pre-installed software on dback can be loaded directly:
```
module load BEDTools/2.29.0
module load bwa/0.7.17
module load  samtools/1.9
```
These following Python modules were already installed under Python/3.8.2:
```
$ python
Python 3.8.2 (default, Jul 28 2020, 14:42:21) 
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import pysam
>>> print(pysam.__version__)
0.16.0.1
>>> import tabulate
>>> print(tabulate.__version__)
0.8.7
>>> import matplotlib
>>> print(matplotlib.__version__)
3.4.1
>>> import pandas
>>> print(pandas.__version__)
1.2.2
>>> import pairtools
>>> print(pairtools.__version__)
0.3.0
```

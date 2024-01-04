# Neural-Modeling-Manual Chapter 1
## There are several tools that are needed in order to start Neural modeling. The primary lanuage of this manual will be the Python programing lanuage. The best way to properly set up a python evironmnet is to use [Anaconda](https://www.anaconda.com/download). After installing Anaconda you need to create a python environment. The instructions are slightly different for Windows, MacOS and Linux so i will provide general instuctions and if you need more details there is plenty of infomation online just google 'how to set up a python evironment using anaconda' or something like that. 

## If you are not very familar with python it may be helpful to go over some basics. Not much advanced software experience is needed to be an good neural modeler. A breif python tutorial can be found at this [link](https://colab.research.google.com/github/data-psl/lectures2020/blob/master/notebooks/01_python_basics.ipynb). This colab goes over some basics of python and two important packages (Numpy and matplotlib).

## To get started with the software install you need to open up an anaconda terminal window. Typically to do this on window after installing anaconda you should have something called the anaconda prompt installed, for Mac and Linux you can just use the terminal(again google is your friend to learn). If you have a Mac computer you will need to make sure you have command line tools installed. To do this run this command in terminal to install them. If your not on a Mac you can skip this step
```
xcode-select --install
```

## Once that is open you use the command


```
conda create --name neural-modeling python=3.8 
```
## This will create an enviroment which is where you can run python code and install python packages.You need to activate this enviroment before you do anything. To do so use the command
```
conda activate neural-modeling
```

## Next we need to install python packages that we will be using. First we will install the [Brain modeling toolkit](https://alleninstitute.github.io/bmtk/). To do so we will first clone and then install BMTK. This method installs the very lastest version of the software. You can also do a pip install, but that is not always the most up to date.
```
 git clone https://github.com/AllenInstitute/bmtk.git
 cd bmtk
 python setup.py install
```
## You may also need to install another package called mpi4py
```
python -m pip install mpi4py
```

## Next we will install [Neuron](https://nrn.readthedocs.io/en/8.2.2/install/install.html). The install process is different for Windows and MacOS/Linux. To install the Windows release you click on the link above and follow the instuctions from there. For MacOS and Linux you use the command
```
pip install neuron
```

## To check if the evironment you just built is working correctly there is test code in this section. If you are testing the evironment on a high preformance computing server skip to the next code block! To run the test use the following commands. Before running the commands make sure your working directory is the Network-modeling-manual folder on your computer. If you are on windows a line will needed to be changed. Windows is unable to compile modfiles automaticly like MacOS and Linux. You need to change the line 31 in example.py from True to False. Then you need to compile the mechanisms your self. Below is an example what that would look like. Note the first time you run the script it downloads some files but then will have an error. We will then use those downloaded files and the model will run correct the second time. If you are on MacOS or Linux skip the next 2 code blocks

## Change example.py to look like this if you are on windows. The only change is compile_mechanisms=False.
```python
build_env_bionet(base_dir='sim_ch01',      # Where to save the scripts and config files
                 network_dir='network',    # Location of directory containing network files
                 tstop=2000.0, dt=0.1,     # Run a simulation for 2000 ms at 0.1 ms intervals
                 report_vars=['v', 'cai'], # Tells simulator we want to record membrane potential and calcium traces
                 current_clamp={           # Creates a step current from 500.ms to 1500.0 ms
                     'amp': 0.120,
                     'delay': 500.0,
                     'duration': 1000.0
                 },
                 include_examples=True,    # Copies components files
                 compile_mechanisms=False,  # Will try to compile NEURON mechanisms 
                 config_file='config.json'
                )
```
## Run example.py once to download needed files. This will have an error that ok for now! Then this code block will go to the mechanism folder and properly compile modfiles. Finally it will go back and run example.py again and this time it should work!
```
cd Chapter-1-Getting-started-with-modeling/network-example/
python example.py
cd sim_ch01/components/mechanisms/
nrnivmodl modfiles
cd ../../..
python example.py
```
## If you are on MacOS or Linux then all you should need to do is this code block

```
cd Chapter-1-Getting-started-with-modeling/network-example/
python example.py
```
## If everything worked properly you should have a graph pop up onto your screen of a voltage trace. Then once you close that plot another graph will appear showing calcium. If these both display then your evironment is set up correctly.

## Most high preformance computing(HPC) servers use [SLURM](https://slurm.schedmd.com) to manager running code. To test your enviroment on one of these computers first clone this repo onto the server. Make sure that your working directory is the Network-Modeling-Manual folder before running this commands.
```
cd Chapter-1-Getting-started-with-modeling/SLURM-test/
sbatch batch_build.sh
```
 ## That command will build the test network and the next command will run the network. This test case will run the network on two cores to see if your mpi is set up correctly. Depending on the HPC you are running on you will most likely need to load a module that contains mpi in order to run on multiple cores. Loading this mpi module is different on every HPC so you will need to look into this process for your HPC server. After you have loaded the module use the following command.
```
 sbatch batch_run.sh
```
## It is also important to note that the batch files in the SLRUM-test folder are general files and will need to be altered slightly depending on what HPC you are running on.

## Hopefully now your modeling software is working correctly. There is one last helpful package that is helpful when working with BMTK models. The package BMTool is a package to help analysis a network and will be used thoughout the manual. To install use the commands.
```
git clone https://github.com/tjbanks/bmtool
cd bmtool
python setup.py develop
```
## There is also a pip install for this package as well.

## The last step will be do install your integrated development environment (IDE). One of the most popular is called [VScode](https://code.visualstudio.com). To install use the link and download the latest version. Once you download VScode you can then download the python extension. If you are working on a HPC server it can also be nice to install the remote - SSH extensions. There are also jupyter extensions which can also be installed easily if you plan on using jupyter notebooks. Finally you need to activate your Anaconda environment in VScode. To do so open the Command Palette (Ctrl+Shift+P), type ‘Python: Select Interpreter’, and hit Enter. A list of available interpreters will appear. Select the one that corresponds to your Anaconda environment. There are loads of way to use VScode for some tips and tricks or if you are stuck on how to use VScode with your Anaconda environment google something like 'How to use VS code for python coding' or 'How do I use VScode with my Anaconda environment'

## You should now have everything set up to begain development of biologicaly realistic neural network!

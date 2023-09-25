# Neural-Modeling-Manual Chapter 1
## The best way to properly set up a python evironmnet is to use [Anaconda](https://www.anaconda.com/download). After installing Anaconda you need to create a python environment. The instructions are slightly different for Windows, MacOS and Linux so i will provide general instuctions and if you need more details there is plenty of infomation online. You need to open up an anconda terminal window. Then you use the command

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

## If you wish to install the version that supports running code on GPUs you use. To run on GPU you will need to run your model using coreNeuron. This may need other packages installed and is currently changing constanstly. I would not recommend someone new to install this version.
```
pip install neuron-gpu-nightly
```

## There is also a nightly version for the lastest neuron with CPU support that also supports coreNeuron. Same as above this is a very new development and I recommend the average user to install the regular version. 
```
pip install neuron-nightly
```

## To check if the evironment you just built is working correctly there is test code in this section. If you are testing the evironment on a high preformance computing server skip to the next code block! To run the test use the following commands. Before running the commands make sure your working directory is the Network-modeling-manual folder on your computer.
```
cd Section1-Getting\ started\ with\ modeling/network-example/
python example.py
```
## If everything worked properly you should have a graph pop up onto your screen of a voltage trace. Then once you close that plot another graph will appear showing calcium. If these both display then your evironment is set up correctly.

## Most high preformance computing(HPC) servers use [SLURM](https://slurm.schedmd.com) to manager running code. To test your enviroment on one of these computers first clone this repo onto the server. Make sure that your working directory is the Network-Modeling-Manual folder before running this commands.
 ```
 cd Section1-Getting\ started\ with\ modeling/SLURM-test/
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

## The last step will be do install your integrated development environment (IDE). One of the most popular is called [VScode](https://code.visualstudio.com). To install use the link and download the latest version. Once you download VScode you can then download the python extension. If you are working on a HPC server it can also be nice to install the remote - SSH extensions. There are also jupyter extensions which can also be installed easily if you plan on using jupyter notebooks. Finally you need to activate your Anaconda environment in VScode. To do so open the Command Palette (Ctrl+Shift+P), type ‘Python: Select Interpreter’, and hit Enter. A list of available interpreters will appear. Select the one that corresponds to your Anaconda environment.

## You should now have everything set up to begain development of biologicaly realistic neural network!
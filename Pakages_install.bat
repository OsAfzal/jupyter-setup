@echo off
echo Installing Python Libraries...

python -m pip install --upgrade pandas numpy matplotlib seaborn scikit-learn scipy statsmodels npstat jupyter
python -m pip install --upgrade jupyterlab jupyterlab-git

echo Python libraries Installed Successfully!

echo Installing R Kernel... 
R -e "install.packages(c('IRkernel' , 'rlang', 'lifecycle' 'tidyverse'), repos='https://cran.rstudio.com/')"
R -e "IRkernel::installspec(name = 'ir', displayname = 'R')"

pause

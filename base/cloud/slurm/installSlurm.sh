SLURM_DIR='/opt/slurm/19.05.2.1/'

set -e
CURRDIR='/tmp'
cd $CURRDIR

if [ ! -d $SLURM_DIR ];
then
  mkdir -p $SLURMDIR
  tar -xzvf slurm-19-05-2-1.tar.gz
  rm -f slurm-19-05-2-1.tar.gz

  cd slurm-slurm-19-05-2-1
  ./configure --prefix=$SLURM_DIR
  make -j40 all
  make -j40 install
  cd $CURRDIR
  rm -rf slurm-slurm-19-05-2-1
fi

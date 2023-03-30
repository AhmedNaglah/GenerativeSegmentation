#!/bin/sh
#SBATCH --account=pinaki.sarder
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=7000mb
#SBATCH --partition=gpu
#SBATCH --gpus=geforce
#SBATCH --time=72:00:00
#SBATCH --output=Naglah_DatasetGAN.out
#SBATCH --job-name="Naglah_DatasetGAN"
echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST="$SLURM_JOB_NODELIST
echo "SLURM_NNODES="$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR

echo "working directory = "$SLURM_SUBMIT_DIR
ulimit -s unlimited
module load singularity
ls
ml

# Add your userid here:
USER=ahmed.naglah
# Add the name of the folder containing WSIs here
PROJECT=datasetGAN

CONTAINER=/blue/pinaki.sarder/$USER/codes/datasetgan.sif
SCRIPT=/blue/pinaki.sarder/$USER/codes/datasetGAN_release/datasetGAN/train_interpreter.py
DATADIR=/blue/pinaki.sarder/$USER/data/$PROJECT
EXPERIMENT=/blue/pinaki.sarder/$USER/codes/datasetGAN_release/datasetGAN/experiments/face_34.json 

singularity exec $CONTAINER python3 $SCRIPT --exp $EXPERIMENT

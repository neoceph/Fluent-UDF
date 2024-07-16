#!/bin/sh
## Specifying a job name
#SBATCH --job-name=ANSYS_test
## Reserving one node and 36 cpus
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=36
## Reserving a specific node "node004" and 36 cpus (uncomment if needed)
##SBATCH --nodelist=node004
#SBATCH --time=03:00:00
#SBATCH --mem=5GB
#SBATCH --mail-user=aamin1@udayton.edu
#SBATCH --mail-type=END,FAIL
#SBATCH --error=./error_%j.txt
#SBATCH --output=./output_%j.txt

echo Working directory is $SLURM_SUBMIT_DIR
echo Job name is $SLURM_JOB_NAME
cd $SLURM_SUBMIT_DIR
echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`
echo The following processors are allocated to this job:
echo $SLURM_JOB_NODELIST
NP=$SLURM_NTASKS

# run the simulation

export OMP_NUM_THREADS=36

# Load the module for ansys appropriate installation if necessary
module load ansys/2020R2

fluent 3ddp -t$OMP_NUM_THREADS -g -i ./Example.jou output.txt

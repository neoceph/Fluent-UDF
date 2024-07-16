#!/bin/sh
## Specifying a job name
#PBS -N ANSYS_test
## Reserving one node and 36 cpus
#PBS -l nodes=1:ppn=36
## Reserving a specific node "node004" and 36 cpus
##PBS -l nodes=node004:ppn=36
#PBS -l walltime=03:00:00
#PBS -l mem=5gb
#PBS -M aamin1@udayton.edu
#PBS -e ./error_$PBS_JOBID.txt
#PBS -o ./output_$PBS_JOBID.txt
##PBS -V                     #Pass the current environment variables to the job.

echo Working directory is $PBS_O_WORKDIR
echo Job name is $PBS_JOBNAME
cd $PBS_O_WORKDIR
echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`
echo The following processors are allocated to this job:
echo `cat $PBS_NODEFILE`
NP=`wc -l < $PBS_NODEFILE`

# run the simulation


export OMP_NUM_THREADS=36

# Load the module for ansys appropriate installation if necessary
module load ansys/2020R2

fluent 2ddp -t$OMP_NUM_THREADS -g -i ./Example.jou output.txt
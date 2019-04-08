PROGRAM main
  !$  USE omp_lib
  USE mod_global
  USE mod_proc_int
  USE mod_proc_file

  IMPLICIT NONE
  INTEGER(kind=4)::total_steps,j_dum,k_dum,i_sample,i_step

  ! observables
  REAL(kind=8),ALLOCATABLE::energy(:),ave_energy(:),sum_energy(:)

  CHARACTER(:),ALLOCATABLE::filename_energy
  CHARACTER(len=4)::si_sample

  ! slot variables
  INTEGER(kind=4) :: slot_in_energy,slot_out_energy

  CALL getListParameters_2d(10,"list_parameters.dat",&
       len_x,len_z,J,beta,vel,n_sweeps_therm,n_sweeps_stead,id_IC,id_BC,n_samples,&
       onoff_stream,onoff_m_z)

  total_steps=(len_x*len_z)*n_sweeps_therm+(len_x*len_z+1)*n_sweeps_stead

  ALLOCATE(energy(1:total_steps),ave_energy(1:total_steps),sum_energy(1:total_steps))
  sum_energy(1:total_steps)=0.0d0

  !$omp parallel do schedule(static,1) default(none) &
  !$omp shared(n_samples,total_steps) &
  !$omp private(slot_in_energy,i_sample,si_sample,filename_energy,energy,j_dum,k_dum) &
  !$omp reduction(+:sum_energy)
  DO i_sample=1,n_samples,1
    slot_in_energy=10
    !$ slot_in_energy = 10 + omp_get_thread_num()

     ! WRITE(0, *) 2.1
     ! WRITE(0, *) i_sample
     WRITE(si_sample,"(I0.4)") i_sample
     ! WRITE(0, *) si_sample
     ! WRITE(0, *) 2.15
     filename_energy=TRIM("stream_s"//si_sample//".dat")
     ! WRITE(0, *) 2.2

     OPEN(slot_in_energy, file=filename_energy, status="old")
     ! WRITE(0, *) 2.3
     DO i_step=1,total_steps,1
        READ(slot_in_energy, *)	j_dum,k_dum,energy(i_step)
     END DO
     ! WRITE(0, *) 2.4
     CLOSE(slot_in_energy)
     ! WRITE(0, *) 2.5
     sum_energy(1:total_steps)=sum_energy(1:total_steps)+energy(1:total_steps)
     ! WRITE(0, *) 2.6
  END DO
  !$omp end parallel do

  ave_energy(1:total_steps)=sum_energy(1:total_steps)/DBLE(n_samples)
  slot_out_energy=20

  OPEN(slot_out_energy,file="stream.dat",status="new")
  DO i_step=1,total_steps,1
     WRITE(slot_out_energy, "(I0, A, G0)")	i_step,", ",ave_energy(i_step)
  END DO
  CLOSE(slot_out_energy)
END PROGRAM main

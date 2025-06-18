module mo_m4ago_kind
  !-------------------------------------------------------------------------------------------------
  ! M4AGO expects a mo_m4ago_kind module, where the working precision for real values is set
  ! This is thus far little tested, but since BGC models might use different precisions
  ! (while using the same preprocessor directive to switch on the BGC component), this
  ! module allows to adjust the working precision used in M4AGO to the driving BGC model.
  ! Note that this requires to include two pathes for BGC model compilation:
  !     - src/common/
  !     - src/BGC-model-specific/
  !
  ! For adjustment, see e.g. the BGC-specific NorESM-iHAMOCC mo_m4ago_kind.F90 routine
  !-------------------------------------------------------------------------------------------------
use iso_fortran_env, only:  int32, int64, real32, real64, real128

  implicit none

  private

  public :: wp

#ifdef REAL32
  integer,parameter :: rk = real32
#elif REAL128
  integer,parameter :: rk = real128
#else
  integer,parameter :: rk = real64
#endif

!#ifdef INT64
!  integer, parameter :: ik = int64
!#else
!  integer, parameter :: ik = int32
!#endif


  integer, parameter :: wp = rk

end module mo_m4ago_kind

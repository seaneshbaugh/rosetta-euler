module euler
  integer, parameter :: huge = selected_int_kind(18)

contains

  function prime_factors(n) result(factors)
    implicit none
    integer(huge), intent(in) :: n
    integer, dimension(:), allocatable :: factors
    integer, dimension(:), allocatable :: updated_factors
    integer(huge) :: div, next, rest, i

    allocate(factors(1:0))

    i = 1

    div = 2

    next = 3

    rest = n

    do while (rest /= 1)
      do while (mod(rest, div) == 0)
        allocate(updated_factors(size(factors) + 1))

        updated_factors(1:size(factors)) = factors

        updated_factors(size(factors) + 1) = div

        deallocate(factors)

        allocate(factors(size(updated_factors)))

        factors = updated_factors

        deallocate(updated_factors)

        i = i + 1

        rest = rest / div
      enddo

      div = next

      next = next + 2
    enddo

    return
  end function prime_factors
end module euler

program main
  use euler
  implicit none
  integer, dimension(:), allocatable :: factors
  integer(huge) :: max, i

  factors = prime_factors(600851475143_huge)

  max = factors(1)

  do i = 1, size(factors)
    if (factors(i) > max) then
      max = factors(i)
    endif
  enddo

  write(*, '(i4)') max

  deallocate(factors)

  stop
end program main

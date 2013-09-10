program euler
  integer, dimension(:), allocatable :: fibs

  integer, dimension(:), allocatable :: updated_fibs

  integer sum, i

  allocate(fibs(2))

  fibs = (/0, 1/)

  do while (fibs(size(fibs)) + fibs(size(fibs) - 1) < 4000000)
    allocate(updated_fibs(size(fibs) + 1))

    updated_fibs(1:size(fibs)) = fibs

    updated_fibs(size(fibs) + 1) = fibs(size(fibs)) + fibs(size(fibs) - 1)

    deallocate(fibs)

    allocate(fibs(size(updated_fibs)))

    fibs = updated_fibs

    deallocate(updated_fibs)
  end do

  do i = 1, size(fibs)
    if ((mod(fibs(i), 2) == 0)) then
      sum = sum + fibs(i)
    endif
  end do

  write(*, '(i7)') sum
end program euler

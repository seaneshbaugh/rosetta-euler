program euler
  integer sum, i

  sum = 0

  do i = 1, 999
    if ((mod(i, 3) == 0) .or. (mod(i, 5) == 0)) then
      sum = sum + i
    endif
  end do

  write(*, '(i6)') sum
end program euler

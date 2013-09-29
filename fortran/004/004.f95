program euler
  integer max, x, y, p, l, i

  character(6) s, r

  character t

  max = 0

  do x = 100, 999
    do y = 100, 999
      p = x * y

      write(s, '(i0)') p

      write(r, '(i0)') p

      l = len_trim(r)

      do i = 1, l / 2
        t = r(i:i)

        r(i:i) = r(l + 1 - i:l + 1 - i)

        r(l + 1 - i:l + 1 - i) = t
      enddo

      if ((s == r) .and. (p > max)) then
        max = p
      endif
    enddo
  enddo

  write(*, '(i0)') max
end program euler

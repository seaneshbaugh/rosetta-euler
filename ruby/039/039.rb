right_triangles = (1..1000).flat_map { |a| (1..1000).map { |b| { a: a, b: b, c: Math.sqrt((a**2) + (b**2)) } } }

integer_right_triangles = right_triangles.select { |t| t[:a] + t[:b] + t[:c].to_i < 1000 && t[:c] == t[:c].floor }

grouped_by_perimeter = integer_right_triangles.group_by { |t| t[:a] + t[:b] + t[:c].to_i }

puts grouped_by_perimeter.max_by { |_perimeter, triangles| triangles.length }.first

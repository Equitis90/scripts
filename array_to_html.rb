# encoding: utf-8

array = (1..rand(5..100)).map { rand(1..200) }

division_arry = array.size.divmod(7)

row_count = division_arry[0]
row_count += 1 if division_arry[1] != 0

i = 0

file = File.new('result.html', 'w+')

begin
  file.write(
  "<!DOCTYPE HTML>
<html>
\t<head>
\t\t<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
\t\t<title>Table</title>
\t</head>
\t<body>
\t\t<table border='1' style='width:100%'>
  ")

  row_count.times do
    file.write("\t\t\t<tr>\r\n")
    7.times do
      file.write("\t\t\t\t<td>#{array[i].nil? ? '&nbsp' : array[i]}</td>\r\n")
      i += 1
    end
    file.write("\t\t\t</tr>\r\n")
  end

  file.write(
  "\t\t</table>
\t</body>
</html>")
ensure
  file.close
end
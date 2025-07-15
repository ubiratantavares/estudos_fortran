set title "Gráfico da função Seno"
set xlabel "x"
set ylabel "y(x)"
set grid
plot "seno.txt" using 1:2 with lines title 'sin(x)'


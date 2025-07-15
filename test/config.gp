set terminal qt 
set title "Gráfico da Função Polinomial de Grau 3"
set xlabel "x"
set ylabel "y"
set grid
set style data linespoints
plot filename using 1:2 with linespoints title 'y = f(x) = -5x³ + 4x² + 2x'


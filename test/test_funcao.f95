program test_funcao

    use funcoes
    use arquivo
    use sistema

    integer :: num_pontos, i, min, max
    real, allocatable :: x(:), y(:)
    real :: a, b, c, d
    character(len=20) :: nome_arquivo1, nome_arquivo2

    nome_arquivo1 = 'dados.txt'
    nome_arquivo2 = 'config.gp'
    
    write(*,*) 'Digite o intervalo do domínio de x:'
    read(*,*) min, max
    
    write(*,*) 'Digite os coeficientes da função cúbica (a, b, c, d):'
    read(*,*) a, b, c, d

    num_pontos = max - min + 1  ! Calcula o número de pontos no intervalo

    allocate(x(num_pontos), y(num_pontos))
    
    do i = 1, num_pontos
        x(i) = real(min - 1 + i)   ! Preenchendo x com valores de 0 a num_pontos-1
        y(i) = funcao_cubica(a, b, c, d, x(i)) 
    end do

    call gravar(nome_arquivo1, x, y, num_pontos)  ! Gravando os dados no arquivo
    !call abrir_visualizador(nome_arquivo1)  ! Abrindo o arquivo com o visualizador padrão

    call executar_gnuplot(nome_arquivo1, nome_arquivo2)  ! Executando o gnuplotcom os comandos do arquivo

    deallocate(x, y)  ! Liberando a memória alocada

end program test_funcao


module arquivo
    implicit none

    contains

    subroutine gravar(nome_arquivo, x_array, y_array, n)
        character(len=*), intent(in) :: nome_arquivo
        integer, intent(in) :: n
        real, dimension(n), intent(in) :: x_array, y_array
        integer :: i, unidade

        unidade = 10  ! Número da unidade de arquivo

        ! Abre o arquivo para escrita
        open(unit=unidade, file=nome_arquivo, status='replace', action='write')

        ! Escreve os dados no arquivo
        do i = 1, n
            write(unidade, '(2(1PE10.2))') x_array(i), y_array(i)
        end do

        ! Fecha o arquivo
        close(unidade)
    end subroutine gravar
        
    subroutine ler(nome_arquivo, x_array, y_array, n)
        character(len=*), intent(in) :: nome_arquivo
        integer, intent(in) :: n
        real, dimension(n), intent(out) :: x_array, y_array
        integer :: i, unidade

        unidade = 10  ! Número da unidade de arquivo

        ! Abre o arquivo para leitura
        open(unit=unidade, file=nome_arquivo, status='old', action='read')

        ! Lê os dados do arquivo
        do i = 1, n
            read(unidade, '(2(1PE10.2))') x_array(i), y_array(i)
        end do

        ! Fecha o arquivo
        close(unidade)
    end subroutine ler      

end module arquivo



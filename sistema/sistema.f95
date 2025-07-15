! Este módulo isola comandos do sistema operacional como abrir arquivos e chamar softwares externos

module sistema

    implicit none

    contains

    subroutine abrir_visualizador(nome_arquivo)
        character(len=*), intent(in) :: nome_arquivo
        integer :: status

        ! Chama o visualizador de texto padrão do sistema operacional
        status = system('xdg-open ' // trim(nome_arquivo))
        if (status /= 0) then
            print *, 'Erro ao abrir o arquivo: ', nome_arquivo
        end if
    end subroutine abrir_visualizador

    subroutine executar_gnuplot(nome_arquivo1, nome_arquivo2)
        character(len=*), intent(in) :: nome_arquivo1, nome_arquivo2
        character(len=512) :: comando
        integer :: status

        comando = 'gnuplot -persist -e "filename=''' // TRIM(nome_arquivo1) // '''" ' // TRIM(nome_arquivo2)
        ! Chama o gnuplot com o arquivo especificado
        status = system(comando)

        if (status /= 0) then
            print *, 'Erro ao executar gnuplot'
        end if
    end subroutine executar_gnuplot

end module sistema


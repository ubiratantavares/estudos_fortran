! gfortran -c io/modulo_escrita.f95 -J build/

module modulo_escrita

    implicit none

    interface exibir_mensagem_valor
        module procedure exibir_mensagem_inteiro
        module procedure exibir_mensagem_real
        module procedure exibir_mensagem_string
    end interface 

contains

    ! procedimento para exibir apenas o texto
    subroutine exibir_mensagem(texto)
        character(len=*), intent(in) :: texto
        print *, trim(texto)
    end subroutine exibir_mensagem

    ! exibe mensagem + valor inteiro
    subroutine exibir_mensagem_inteiro(texto, valor)
        character(len=*), intent(in) :: texto
        integer, intent(in) :: valor
        print *, trim(texto), valor
    end subroutine exibir_mensagem_inteiro

    ! exibe mensagem + valor real
    subroutine exibir_mensagem_real(texto, valor)
        character(len=*), intent(in) :: texto
        real, intent(in) :: valor
        print *, trim(texto), valor
    end subroutine exibir_mensagem_real

    ! exibe mensagem + valor string
    subroutine exibir_mensagem_string(texto, valor)
        character(len=*), intent(in) :: texto
        character(len=*), intent(in) :: valor
        print *, trim(texto), trim(valor)
    end subroutine exibir_mensagem_string

end module modulo_escrita

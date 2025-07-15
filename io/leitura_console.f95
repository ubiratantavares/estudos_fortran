! gfortran -c io/modulo_leitura_console.f95 -J build/

module modulo_leitura_console

    implicit none

    interface ler_valor
    	module procedure ler_valor_inteiro
    	module procedure ler_valor_real
    	module procedure ler_valor_string
    end interface

contains

    ! procedimento para ler valor inteiro
    subroutine ler_valor_inteiro(valor_inteiro)
        integer, intent(out) :: valor_inteiro
        read *, valor_inteiro
    end subroutine ler_valor_inteiro

    ! procedimento para ler valor real
    subroutine ler_valor_real(valor_real)
        real, intent(out) :: valor_real
        read *, valor_real
    end subroutine ler_valor_real

    ! procedimento para ler valor string
    subroutine ler_valor_string(valor_string)
        character(len=255), intent(out) :: valor_string
        read *, valor_string
    end subroutine ler_valor_string

end module modulo_leitura_console

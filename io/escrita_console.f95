! gfortran -c io/modulo_escrita_console.f95 -J build/

module modulo_escrita_console

    use iso_fortran_env

    implicit none

    interface exibir_mensagem_valor
        module procedure exibir_mensagem_valor_inteiro
        module procedure exibir_mensagem_valor_real
        module procedure exibir_mensagem_valor_real64
        module procedure exibir_mensagem_valor_string
    end interface 

    interface exibir_valor
		module procedure exibir_valor_inteiro
		module procedure exibir_valor_real
		module procedure exibir_valor_string	
    end interface

contains

	! procedimento para exibir valor inteiro
	subroutine exibir_valor_inteiro(valor_inteiro)
		integer, intent(in) :: valor_inteiro
		print *, valor_inteiro
	end subroutine exibir_valor_inteiro

	! procedimento para exibir valor real
	subroutine exibir_valor_real(valor_real)
		real, intent(in) :: valor_real
		print *, valor_real
	end subroutine exibir_valor_real

    ! procedimento para exibir valor string
    subroutine exibir_valor_string(valor_string)
        character(len=*), intent(in) :: valor_string
        print *, trim(valor_string)
    end subroutine exibir_valor_string

    ! procedimento para exibir mensagem e valor inteiro
    subroutine exibir_mensagem_valor_inteiro(mensagem, valor_inteiro)
        character(len=*), intent(in) :: mensagem
        integer, intent(in) :: valor_inteiro
        print *, trim(mensagem), valor_inteiro
    end subroutine exibir_mensagem_valor_inteiro

    ! procedimento para exibir mensagem e valor real
    subroutine exibir_mensagem_valor_real(mensagem, valor_real)
        character(len=*), intent(in) :: mensagem
        real, intent(in) :: valor_real
        print *, trim(mensagem), valor_real
    end subroutine exibir_mensagem_valor_real

    subroutine exibir_mensagem_valor_real64(mensagem, valor_real64)
        character(len=*), intent(in) :: mensagem
        real(real64), intent(in) :: valor_real64
        print *, trim(mensagem), valor_real64
    end subroutine exibir_mensagem_valor_real64

    ! procedimento para exibir mensagem e valor string
    subroutine exibir_mensagem_valor_string(mensagem, valor_string)
        character(len=*), intent(in) :: mensagem
        character(len=*), intent(in) :: valor_string
        print *, trim(mensagem), trim(valor_string)
    end subroutine exibir_mensagem_valor_string

end module modulo_escrita_console

! gfortran -c io/modulo_leitura.f95 -I io/ -J build/

module modulo_leitura

    use modulo_escrita

    implicit none

    interface ler_valor
    	module procedure ler_inteiro
    	module procedure ler_real
    	module procedure ler_string
    end interface

contains

	! procedimento para ler um inteiro
    subroutine ler_inteiro(texto, valor)
        character(len=*), intent(in) :: texto
        integer, intent(out) :: valor
		call exibir_mensagem(texto)
		read *, valor
    end subroutine ler_inteiro

	! procedimento para ler um real
    subroutine ler_real(texto, valor)
        character(len=*), intent(in) :: texto
        real, intent(out) :: valor
		call exibir_mensagem(texto)
		read *, valor
    end subroutine ler_real

	! procedimento para ler uma string (tamanho fixo)
    subroutine ler_string(texto, valor)
        character(len=*), intent(in) :: texto
        character(len=255), intent(out) :: valor
		call exibir_mensagem(texto)
		read *, valor
    end subroutine ler_string

end module modulo_leitura

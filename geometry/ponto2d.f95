! gfortran -c geometry/modulo_ponto2d.f95 -J build/ -I io/

! Este módulo define a estrutura do tipo Ponto2D e as operações associadas a ele.

module modulo_ponto2d

    use modulo_leitura_console

    implicit none

    type :: Ponto2D
        real :: x
        real :: y
    end type Ponto2D

contains

    function variacao_eixo(valor1, valor2) result(resultado)
        real, intent(in) :: valor1, valor2
        real :: resultado

        resultado = abs(valor2 - valor1)
    end function variacao_eixo

    function calcula_raiz_quadrada(valor) result(resultado)
        real, intent(in) :: valor
        real :: resultado

        if (valor < 0.0) then
            print *, "Erro: Não é possível calcular a raiz quadrada de um número negativo."
            resultado = -1.0 ! Valor inválido
        else
            resultado = sqrt(valor)
        end if
    end function calcula_raiz_quadrada

    function calcula_potencia(base, expoente) result(resultado)
        real, intent(in) :: base
        integer, intent(in) :: expoente
        real :: resultado

        if (expoente < 0) then
            print *, "Erro: Expoente negativo não suportado."
            resultado = -1.0 ! Valor inválido
        else
            resultado = base ** expoente
        end if
    end function calcula_potencia

    function distancia_euclidiana(p1, p2) result(resultado)
        type(Ponto2D), intent(in) :: p1, p2
        real :: dx, dy, resultado

        dx = variacao_eixo(p1%x, p2%x)
        dy = variacao_eixo(p1%y, p2%y)
        resultado = calcula_raiz_quadrada(calcula_potencia(dx, 2) + calcula_potencia(dy, 2))
    end function distancia_euclidiana

    subroutine ler_ponto(p)
        type(Ponto2D), intent(out) :: p
        call ler_valor(p%x)
        call ler_valor(p%y)
    end subroutine ler_ponto

    subroutine exibir_ponto(p)
        type(Ponto2D), intent(in) :: p
        print *, 'Ponto (', p%x, ',', p%y, ')'
    end subroutine exibir_ponto

    function gerar_ponto_aleatorio() result(p)
        type(Ponto2D) :: p
        call random_number(p%x)
        call random_number(p%y)
    end function gerar_ponto_aleatorio

end module modulo_ponto2d
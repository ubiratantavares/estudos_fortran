! gfortran -c geometry/modulo_circulo.f95 -J build/ -I geometry/

! Este módulo define a estrutura do tipo Ponto2D e as operações associadas a ele.

module modulo_circulo

    use modulo_ponto2d

    implicit none

    type :: Circulo
        type(Ponto2D) :: centro
        real :: raio
    end type Circulo

contains

    function ponto_esta_dentro_do_circulo(c, p) result(resultado)
        type(Circulo), intent(in) :: c
        type(Ponto2D), intent(in) :: p
        real :: dx, dy
        logical :: resultado

        dx = variacao_eixo(c%centro%x, p%x)
        dy = variacao_eixo(c%centro%y, p%y)
        resultado = (calcula_potencia(dx, 2) + calcula_potencia(dy, 2)) <= c%raio**2
    end function ponto_esta_dentro_do_circulo

    function area_do_circulo(c) result(resultado)
        type(Circulo), intent(in) :: c
        real :: pi, resultado
    
        resultado = pi * c%raio**2
    end function area_do_circulo

    function perimetro_do_circulo(c) result(resultado)
        type(Circulo), intent(in) :: c
        real :: pi, resultado
    
        resultado = 2 * pi * c%raio
    end function perimetro_do_circulo

end module modulo_circulo


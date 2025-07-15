! gfortran -c geometry/modulo_triangulo.f95 -I geometry/ -J build/

! Este módulo define a estrutura do tipo Triangulo e as operações associadas a ele.

module modulo_triangulo

    use modulo_ponto2d

    implicit none

    type :: Triangulo
        type(Ponto2D), dimension(3) :: pontos
    end type Triangulo

contains

    function forma_triangulo(t) result(resultado)
        type(Triangulo), intent(in) :: t
        real :: area
        logical :: resultado

        area = 0.5 * abs((t%pontos(1)%x * (t%pontos(2)%y - t%pontos(3)%y) + &
                          t%pontos(2)%x * (t%pontos(3)%y - t%pontos(1)%y) + &
                          t%pontos(3)%x * (t%pontos(1)%y - t%pontos(2)%y)))
        resultado = area > 0.0
    end function forma_triangulo
    
    subroutine ler_pontos(t)
        type(Triangulo), intent(out) :: t
        integer :: i

        do i = 1, 3
            print *, 'Digite as coordenadas do ponto ', i, ':'
            call ler_ponto(t%pontos(i))
        end do
    end subroutine ler_pontos

    subroutine exibir_triangulo(t)
        type(Triangulo), intent(in) :: t
        integer :: i

        print *, 'Triângulo formado pelos pontos:'
        do i = 1, 3
            print *, 'Ponto ', i, ': (', t%pontos(i)%x, ',', t%pontos(i)%y, ')'
        end do
    end subroutine exibir_triangulo

    function perimetro_triangulo(t) result(resultado)
        type(Triangulo), intent(in) :: t
        real :: resultado
        integer :: i

        resultado = 0.0
        do i = 1, 3
            resultado = resultado + distancia_euclidiana(t%pontos(i), t%pontos(mod(i, 3) + 1))
        end do
    end function perimetro_triangulo

    function area_triangulo(t) result(resultado)
        type(Triangulo), intent(in) :: t
        real :: resultado

        resultado = 0.5 * abs((t%pontos(1)%x * (t%pontos(2)%y - t%pontos(3)%y) + &
                               t%pontos(2)%x * (t%pontos(3)%y - t%pontos(1)%y) + &
                               t%pontos(3)%x * (t%pontos(1)%y - t%pontos(2)%y)))
    end function area_triangulo

    function classificar_triangulo_lados(t) result(resultado)
        class(Triangulo), intent(in) :: t
        character(len=10) :: resultado
        real :: a, b, c, epsilon

        epsilon = 1.0e-6 ! tolerância para comparação de ponto flutuante

        a = distancia_euclidiana(t%pontos(1), t%pontos(2))
        b = distancia_euclidiana(t%pontos(2), t%pontos(3))
        c = distancia_euclidiana(t%pontos(3), t%pontos(1))

        if (abs(a - b) < epsilon .and. abs(b - c) < epsilon) then
            resultado = "equilatero"
        else if (abs(a - b) < epsilon .or. abs(b - c) < epsilon .or. abs(c - a) < epsilon) then
            resultado = "isosceles"
        else
            resultado = "escaleno"
        end if
    end function classificar_triangulo_lados

    function classificar_triangulo_angulos(t) result(resultado)
        class(Triangulo), intent(in) :: t
        character(len=12) :: resultado
        real :: a, b, c, temp
        real :: a2, b2, c2
        real, parameter :: epsilon = 1.0e-6

        ! Calcula os comprimentos dos lados
        a = distancia_euclidiana(t%pontos(1), t%pontos(2))
        b = distancia_euclidiana(t%pontos(2), t%pontos(3))
        c = distancia_euclidiana(t%pontos(3), t%pontos(1))

        ! Ordena os lados para garantir que c seja o maior
        if (a > b) then
            temp = a; a = b; b = temp
        end if
        if (b > c) then
            temp = b; b = c; c = temp
        end if
        if (a > b) then
            temp = a; a = b; b = temp
        end if

        ! Quadrados dos lados
        a2 = a*a
        b2 = b*b
        c2 = c*c

        ! Classificação com base nos ângulos
        if (abs(a2 + b2 - c2) < epsilon) then
            resultado = "retangulo"
        else if (a2 + b2 > c2) then
            resultado = "acutangulo"
        else
            resultado = "obtusangulo"
        end if
    end function classificar_triangulo_angulos

end module modulo_triangulo

    
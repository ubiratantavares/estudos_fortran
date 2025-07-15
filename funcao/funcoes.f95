! Este módulo agrupa funções matemáticas genéricas de uma variável

module funcoes
    implicit none

    contains

    function funcao_cubica(a, b, c, d, x) result(fx)
        real, intent(in) :: a, b, c, d, x
        real :: fx

        ! Calcula o valor da função cúbica f(x) = ax^3 + bx^2 + cx + d
        fx = a * x**3 + b * x**2 + c * x + d
    end function funcao_cubica

    function funcao_quadratica(a, b, c, x) result(fx)
        real, intent(in) :: a, b, c, x
        real :: fx

        ! Calcula o valor da função quadrática f(x) = ax^2 + bx + c
        fx = a * x**2 + b * x + c
    end function funcao_quadratica

    function funcao_linear(a, b, x) result(fx)
        real, intent(in) :: a, b, x
        real :: fx

        ! Calcula o valor da função linear f(x) = ax + b
        fx = a * x + b
    end function funcao_linear

    function funcao_constante(c) result(fx)
        real, intent(in) :: c
        real :: fx

        ! Retorna o valor constante c
        fx = c
    end function funcao_constante   

    function funcao_exponencial(a, b, x) result(fx)
        real, intent(in) :: a, b, x
        real :: fx

        ! Calcula o valor da função exponencial f(x) = a * exp(b * x)
        fx = a * exp(b * x)
    end function funcao_exponencial

    function funcao_logaritmica(a, b, x) result(fx)
        real, intent(in) :: a, b, x
        real :: fx

        ! Calcula o valor da função logarítmica f(x) = a * log(b * x)
        if (x > 0.0) then
            fx = a * log(b * x)
        else
            fx = 0.0  ! Retorna 0 para valores não válidos
        end if
    end function funcao_logaritmica

    function funcao_seno(a, b, x) result(fx)
        real, intent(in) :: a, b, x
        real :: fx

        ! Calcula o valor da função seno f(x) = a * sin(b * x)
        fx = a * sin(b * x)
    end function funcao_seno

    function funcao_cosseno(a, b, x) result(fx)
        real, intent(in) :: a, b, x
        real :: fx

        ! Calcula o valor da função cosseno f(x) = a * cos(b * x)
        fx = a * cos(b * x)
    end function funcao_cosseno

    function funcao_tangente(a, b, x) result(fx)
        real, intent(in) :: a, b, x
        real :: fx

        ! Calcula o valor da função tangente f(x) = a * tan(b * x)
        fx = a * tan(b * x)
    end function funcao_tangente

    function funcao_raiz_quadrada(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função raiz quadrada f(x) = a * sqrt(x)
        if (x >= 0.0) then
            fx = a * sqrt(x)
        else
            fx = 0.0  ! Retorna 0 para valores não válidos
        end if
    end function funcao_raiz_quadrada

    function funcao_modulo(x) result(fx)
        real, intent(in) :: x
        real :: fx

        ! Calcula o valor absoluto de x
        if (x < 0.0) then
            fx = -x
        else
            fx = x
        end if
    end function funcao_modulo

    function funcao_senohiperbolico(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função seno hiperbólico f(x) = a * sinh(x)
        fx = a * sinh(x)
    end function funcao_senohiperbolico

    function funcao_cossenohiperbolico(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função cosseno hiperbólico f(x) = a * cosh(x)
        fx = a * cosh(x)
    end function funcao_cossenohiperbolico  

    function funcao_tangenhiperbolico(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função tangente hiperbólica f(x) = a * tanh(x)
        fx = a * tanh(x)
    end function funcao_tangenhiperbolico   

    function funcao_arcseno(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função arco seno f(x) = a * asin(x)
        if (x >= -1.0 .and. x <= 1.0) then
            fx = a * asin(x)
        else
            fx = 0.0  ! Retorna 0 para valores fora do domínio
        end if
    end function funcao_arcseno 

    function funcao_arccoseno(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função arco cosseno f(x) = a * acos(x)
        if (x >= -1.0 .and. x <= 1.0) then
            fx = a * acos(x)
        else
            fx = 0.0  ! Retorna 0 para valores fora do domínio
        end if
    end function funcao_arccoseno

    function funcao_arctangente(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função arco tangente f(x) = a * atan(x)
        fx = a * atan(x)
    end function funcao_arctangente 

    function funcao_arcsenohiperbolico(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função arco seno hiperbólico f(x) = a * asinh(x)
        fx = a * asinh(x)
    end function funcao_arcsenohiperbolico  

    function funcao_arccossenohiperbolico(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função arco cosseno hiperbólico f(x) = a * acosh(x)
        if (x >= 1.0) then
            fx = a * acosh(x)
        else
            fx = 0.0  ! Retorna 0 para valores fora do domínio
        end if
    end function funcao_arccossenohiperbolico   

    function funcao_arctangenhiperbolico(a, x) result(fx)
        real, intent(in) :: a, x
        real :: fx

        ! Calcula o valor da função arco tangente hiperbólica f(x) = a * atanh(x)
        if (x > -1.0 .and. x < 1.0) then
            fx = a * atanh(x)
        else
            fx = 0.0  ! Retorna 0 para valores fora do domínio
        end if
    end function funcao_arctangenhiperbolico    

end module funcoes
! Fim do módulo funcoes.f95

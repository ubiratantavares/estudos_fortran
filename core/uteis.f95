module modulo_funcoes
    implicit none
    
    contains

    function sao_iguais(a, b) result(resultado)
        integer, intent(in) :: a, b
        logical :: resultado
        resultado = a == b
    end function sao_iguais

    function sao_diferentes(a, b) result(resultado)
        integer, intent(in) :: a, b
        logical :: resultado
        resultado = a /= b
    end function sao_diferentes

    function eh_maior(a, b) result(resultado)
        integer, intent(in) :: a, b
        logical :: resultado
        resultado = a > b
    end function eh_maior

    function eh_menor(a, b) result(resultado)
        integer, intent(in) :: a, b
        logical :: resultado
        resultado = a < b
    end function eh_menor

    function maior(a, b) result(resultado)
        integer, intent(in) :: a, b
        integer :: resultado
        if (eh_maior(a, b)) then
            resultado = a
        else
            resultado = b
        endif
    end function maior

    function menor(a, b) result(resultado)
        integer, intent(in) :: a, b
        integer :: resultado
        if (eh_menor(a, b)) then
            resultado = a
        else
            resultado = b
        endif
    end function menor

    function eh_par(a) result(resultado)
        integer, intent(in) :: a
        logical :: resultado
        resultado = mod(a, 2) == 0
    end function eh_par

    function eh_primo(a) result(resultado)
        integer, intent(in) :: a
        integer :: i
        logical :: resultado
        resultado  = .true.
        do i = 2, a - 1
            if (mod(a, i) == 0) then
                resultado = .false.
                exit
            end if
        end do
    end function eh_primo

    function mdc(a, b) result(resultado)
        integer, intent(in) :: a, b
        integer :: resultado
        integer :: temp_a, temp_b

        temp_a = abs(a)
        temp_b = abs(b)

        ! Algoritmo de Euclides
        do while (temp_b /= 0)
            temp_a = temp_a - temp_b * (temp_a / temp_b)
            temp_a = temp_b
            temp_b = temp_a - temp_b * (temp_a / temp_b)
        end do

        resultado = temp_a

    end function mdc

    function mmc(a, b) result(resultado)
        integer, intent(in) :: a, b
        integer :: resultado

        resultado = abs(a * b) / mdc(a, b)

    end function mmc

    function potencia(a, b) result(resultado)
        integer, intent(in) :: a, b
        integer :: i
        integer :: resultado
        resultado = 1 
        do i = 1, b
            resultado = resultado * a
        end do
    end function potencia

    recursive function fatorial(a) result(resultado)
        integer, intent(in) :: a
        integer :: resultado
        if (a == 0) then
            resultado = 1
        else
            resultado = a * fatorial(a - 1)
        end if
    end function fatorial

    function pi() result(resultado)
        implicit none
        real :: resultado
        resultado = acos(-1.0)
    end function pi

    function converter_angulo_de_graus_para_radianos(a) result(resultado)
        implicit none
        real, intent(in) :: a
        real :: resultado
        resultado = a * (pi() / 180.0)
    end function converter_angulo_de_graus_para_radianos

    function converter_temperatura_farenheit_para_celsius(valor) result(resultado)
        implicit none
        real, intent(in) :: valor
        real :: resultado
        resultado = (valor - 32.0) * (5. / 9.)
    end function converter_temperatura_farenheit_para_celsius

    function divisao(a, b) result(resultado)
        implicit none
        real, intent(in) :: a, b
        real :: resultado
        resultado = a / b
    end function divisao

    function multiplicacao(a, b) result(resultado)
        implicit none
        real, intent(in) :: a, b
        real :: resultado
        resultado = a * b
    end function multiplicacao

    function calcular_area_circulo(raio) result(resultado)
        implicit none
        real, intent(in) :: raio
        real :: resultado
        resultado = pi() * (raio ** 2)
    end function calcular_area_circulo

    function calcular_imc(peso, altura) result(resultado)
        implicit none
        real, intent(in) :: peso, altura
        real :: resultado
        resultado = peso / (altura ** 2)
    end function calcular_imc

end module modulo_funcoes

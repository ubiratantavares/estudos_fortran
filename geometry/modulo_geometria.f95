! gfortran -c geometry/modulo_geometria.f95 -I geometry/ -J build/

module modulo_geometria
    implicit none

    type :: Ponto2D
        real :: x
        real :: y
    end type Ponto2D

    type :: Triangulo
        type(Ponto2D), dimension(3) :: pontos
    end type Triangulo

contains

    function distancia(p1, p2) result(dist)
        type(Ponto2D), intent(in) :: p1, p2
        real :: dx, dy, dist

        dx = p2%x - p1%x
        dy = p2%y - p1%y

        dist = sqrt(dx**2 + dy**2)
    
    end function distancia

    subroutine ler_ponto(mensagem, p)
        character(len=*), intent(in) :: mensagem
        type(Ponto2D), intent(out) :: p
        print *, mensagem
        read *, p%x, p%y
    end subroutine ler_ponto

    subroutine exibir_ponto(p)
        type(Ponto2D), intent(in) :: p
        print *, 'Ponto (', p%x, ',', p%y, ')'
    end subroutine exibir_ponto

    function esta_dentro_do_circulo(p, r) result(valor)
        type(Ponto2D), intent(in) :: p
        real, intent(in) :: r ! raio
        logical :: valor        
        valor = p%x**2 + p%y**2 <= r
    end function esta_dentro_do_circulo


	! o valor de pi pode ser estimado utilizando pontos aleatórios no interior de um quadrado de lado unitário, vértice inferior esquerdo em (0, 0) e vértice superior direito em (1, 1). 
	! A estimativa é dada por: pi aproximadamente 4 * (NPC / NPQ), onde:
	! *  NPC é o número de pontos no interior da restrição da circunferência de raio unitário no primeiro quadrante
	! *  NPQ é o número total de pontos no interior do quadrado.

    function estimar_valor_de_pi(npq) result(pi)
        integer, intent(in) :: npq
        real:: r
        integer :: i, npc
        real :: pi
        type(Ponto2D) :: p
        npc = 0
        r = 1.0
        call random_seed()
        do i = 1, npq
            p = gerar_ponto_aleatorio()
            if (esta_dentro_do_circulo(p, r)) then
                npc = npc + 1
            end if
        end do
        pi = 4.0 * real(npc) / real(npq)
    end function estimar_valor_de_pi

    function gerar_ponto_aleatorio() result(p)
        type(Ponto2D) :: p
        call random_number(p%x)
        call random_number(p%y)
    end function gerar_ponto_aleatorio

end module modulo_geometria

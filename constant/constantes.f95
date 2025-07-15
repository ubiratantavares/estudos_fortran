! gfortran -c constant/modulo_constantes.f95 -J build/ -I geometry/ 

module modulo_constantes

    use iso_fortran_env
    use modulo_ponto2d
    use modulo_circulo

    implicit none

    real(real64), parameter :: pi = acos(-1.0_real64)

contains

	! o valor de pi pode ser estimado utilizando pontos aleatórios no interior de um quadrado de lado unitário, vértice inferior esquerdo em (0, 0) e vértice superior direito em (1, 1). 
	! A estimativa é dada por: pi aproximadamente 4 * (NPC / NPQ), onde:
	! *  NPC é o número de pontos no interior da restrição da circunferência de raio unitário no primeiro quadrante
	! *  NPQ é o número total de pontos no interior do quadrado.

    function estimar_pi(npq) result(resultado)
        integer, intent(in) :: npq
        integer :: i, npc
        type (Circulo) :: c
        type(Ponto2D) :: p
        real :: resultado

        npc = 0

        c%centro%x = 0.0
        c%centro%y = 0.0
        c%raio = 1.0    

        call random_seed()

        do i = 1, npq
            p = gerar_ponto_aleatorio()
            if (ponto_esta_dentro_do_circulo(c, p)) then
                npc = npc + 1
            end if
        end do

        resultado = 4.0 * real(npc) / real(npq)

    end function estimar_pi

end module modulo_constantes




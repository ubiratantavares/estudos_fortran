! gfortran -c apps/app_pi.f95 -I geometry/ -I io/ -J build/
! gfortran -o apps/app_pi app_pi.o modulo_geometria.o modulo_leitura.o modulo_escrita.o

! Este programa lê o número de pontos para estimar aproximada o valor de pi.

! gfortran -c apps/app_pi.f95 -I io/ -I geometry/ -J build/

! gfortran -o apps/app_pi app_pi.o modulo_geometria.o modulo_leitura.o modulo_escrita.o

program app_pi

    use modulo_leitura
    use modulo_geometria
    use modulo_escrita

    implicit none

    integer :: npq
    real :: pi_estimado

    call ler_valor('Digite o número de pontos para a estimativa de pi: ', npq)

    pi_estimado = estimar_valor_de_pi(npq)

    call exibir_mensagem_valor('Estimativa aproximada de pi:', pi_estimado)

end program app_pi

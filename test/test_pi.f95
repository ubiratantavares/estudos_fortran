! Este programa lê o número de pontos para estimar aproximada o valor de pi.

! gfortran -c apps/app_pi.f95 -J build/ -I constant/ -I io/

! gfortran -o apps/app_pi app_pi.o modulo_leitura_console.o modulo_escrita_console.o modulo_ponto2d.o modulo_circulo.o modulo_constantes.o


program app_pi

    use modulo_leitura_console
    use modulo_constantes
    use modulo_escrita_console

    implicit none

    integer :: npq
    real    :: estimado

    call exibir_valor('Digite o número de pontos para a estimativa de pi: ')
    call ler_valor(npq)

    estimado = estimar_pi(npq)

    call exibir_mensagem_valor('Valor aproximado de pi:', estimado)
    call exibir_mensagem_valor('      Valor real de pi: ', pi)

end program app_pi

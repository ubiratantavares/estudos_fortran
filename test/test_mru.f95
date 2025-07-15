program app_mru

    use leitura
    use movimento_retilineo_uniforme 
    use escrita

    implicit none

    real :: d, t, v ! d=distancia, t=tempo, v=velocidade media
    integer :: opcao

    do
        print *, 'Menu de Opções:'
        print *, '1 - Calcular Velocidade Média'
        print *, '2 - Calcular Distância'
        print *, '3 - Calcular Tempo'
        print *, '0 - Sair'
        print *, 'Escolha uma opção:'
        read *, opcao

        select case (opcao)
            case (1) 
                call ler_valor_real("Informe a distância (Km): ", d)
                call ler_valor_real("Informe o tempo (h): ", t)
                v = velocidade_media(d, t)
                call exibir_mensagem("Velocidade média (Km/h): ", v)

            case (2) 
                call ler_valor_real("Informe a velocidade média (km/h): ", v)
                call ler_valor_real("Informe o tempo (h) :", t)
                d = distancia(v, t)
                call exibir_mensagem("Distância percorrida (km): ", d)

            case (3)
                call ler_valor_real("Informe a distância (km): ", d)
                call ler_valor_real("Informe a velocidade média (km/h): ", v)
                t = tempo(v, d)
                call exibir_mensagem("Tempo gasto (h): ", t)

            case (0)
                exit

            case default
                print *, 'Opção inválida. Tente novamente.'
        end select
    end do

end program app_mru


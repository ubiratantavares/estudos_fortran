! gfortran -c apps/app_triangulo.f95 -J build/ -I geometry/

! gfortran -o apps/app_triangulo app_triangulo.o modulo_leitura_console.o modulo_escrita_console.o modulo_ponto2d.o modulo_circulo.o modulo_constantes.o modulo_triangulo.o

program app_triangulo

    use modulo_triangulo
    use modulo_escrita_console

    implicit none
    
    type(Triangulo) :: t

    call ler_pontos(t)

    if (forma_triangulo(t)) then
        call exibir_triangulo(t)
        call exibir_mensagem_valor('Triângulo válido: ', 'Sim')
        call exibir_mensagem_valor('Classificação do triângulo por lados: ', classificar_triangulo_lados(t))
        call exibir_mensagem_valor('Classificação do triângulo por ângulos: ', classificar_triangulo_angulos(t))
        call exibir_mensagem_valor('Perímetro do triângulo: ' , perimetro_triangulo(t))
        call exibir_mensagem_valor('Área do triângulo: ', area_triangulo(t))
    else
        print *, 'Os pontos fornecidos não formam um triângulo válido.'
    end if

end program app_triangulo
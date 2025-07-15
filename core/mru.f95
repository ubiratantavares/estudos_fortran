module modulo_mru 
    use funcoes
    implicit none
contains

    function velocidade_media(distancia_km, tempo_h) result(resultado)
        implicit none
        real, intent(in) :: distancia_km, tempo_h
        real :: resultado 
        resultado = divisao(distancia_km, tempo_h)
    end function velocidade_media

    function distancia(velocidade_media_km_por_h, tempo_h) result(resultado)
        implicit none
        real, intent(in) :: velocidade_media_km_por_h, tempo_h
        real :: resultado
        resultado = multiplicacao(velocidade_media_km_por_h, tempo_h)
    end function distancia

    function tempo(velocidade_media_km_por_h, distancia_km) result(resultado)
        implicit none
        real, intent(in) :: velocidade_media_km_por_h, distancia_km
        real :: resultado
        resultado = divisao(distancia_km, velocidade_media_km_por_h)
    end function tempo

end module modulo_mru

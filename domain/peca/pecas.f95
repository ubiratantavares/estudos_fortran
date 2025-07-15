module modulo_pecas

    use modulo_peca

    implicit none

    contains

    subroutine preencher(pecas, numero_de_pecas)
        type(peca), intent(inout) :: pecas(:)
        integer, intent(in) :: numero_de_pecas
        integer :: i
        do i = 1, numero_de_pecas
            call ler_peca(pecas(i))
        end do
    end subroutine preencher

    function obter_tamanho(pecas) result(tamanho)
        type(peca), intent(in) :: pecas(:)
        integer :: tamanho
        tamanho = size(pecas)
    end function obter_tamanho

    subroutine ordenar_por_bubble_sort(pecas)
        type(peca) :: p
        type(peca), intent(inout) :: pecas(:)
        integer :: i, j, n
        n = obter_tamanho(pecas)
        do i = 1, n-1
            do j = 1, n-i
                if (pecas(j)%codigo > pecas(j+1)%codigo) then
                p = pecas(j)
                pecas(j) = pecas(j+1)
                pecas(j+1) = p
                end if
            end do
        end do
    end subroutine ordenar_por_bubble_sort

    subroutine imprimir(pecas)
        type(peca), intent(in) :: pecas(:)
        integer :: i, n
        n = obter_tamanho(pecas)
        do i = 1, n
            call exibir_peca(pecas(i))
        end do
    end subroutine imprimir

    subroutine contabilizar(pecas)
        type(peca), intent(in) :: pecas(:)
        integer :: i, n
        real :: total_por_peca, total
        n = obter_tamanho(pecas)
        total = 0
        do i = 1, n
            total_por_peca = obter_total(pecas(i))
            print *, "Código da peça: ", pecas(i)%codigo, "Sub-total (R$): ", total_por_peca
            total = total + total_por_peca
        end do
        print *, '----------------------------------------------------------'
        print *, 'Valor total das peças em estoque (R$): ', total
    end subroutine contabilizar

end module modulo_pecas

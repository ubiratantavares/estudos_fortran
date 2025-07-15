! gfortran -c modulo_leitura.f95
! gfortran -c modulo_pecas.f95
! gfortran -c modulo_escrita.f95
! gfortran -c modulo_peca.f95
! gfortran modulo_peca.o modulo_leitura.o modulo_pecas.o modulo_escrita.o app_estoque.o -o app_estoque

program app

    use modulo_leitura
    use modulo_peca
    use modulo_pecas

    implicit none

    type(peca), allocatable :: pecas(:)

    integer :: numero_de_pecas

    call ler_valor_inteiro('Quantas peças deseja cadastrar?', numero_de_pecas)

    if (.not.allocated(pecas)) then
        allocate(pecas(numero_de_pecas))
    end if    

    call preencher(pecas, numero_de_pecas)
    call ordenar_por_bubble_sort(pecas)
    call imprimir(pecas)
    call contabilizar(pecas)
    
    deallocate(pecas)

end program app

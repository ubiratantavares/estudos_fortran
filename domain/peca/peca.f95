module modulo_peca

    use modulo_leitura
    use modulo_escrita

    implicit none

    type :: peca
        character(len=50) :: nome
        integer :: codigo
        integer :: quantidade
        real :: preco
    end type peca    

contains

    subroutine ler_peca(p)
        type(peca), intent(inout) :: p
        call ler_valor_inteiro("Digite o código da peça (inteiro):", p%codigo)
        call ler_valor_string("Digite o nome da peça (máximo de 50 caracteres): ", p%nome)
        call ler_valor_real("Digite o preço da peça (real): ", p%preco)
        call ler_valor_inteiro("Digite a quantidade em estoque (inteiro): ", p%quantidade)
        p%nome = trim(p%nome)
    end subroutine ler_peca

    subroutine exibir_peca(p)
        type(peca), intent(in) :: p
        call exibir_texto_valor_inteiro("Código: ", p%codigo)
        call exibir_texto_valor_string("Nome: ", p%nome)
        call exibir_texto_valor_real("Preço: ", p%preco)
        call exibir_texto_valor_inteiro("Quantidade: ", p%quantidade)
        call exibir_texto("----------------------------------------------------------")
    end subroutine exibir_peca

    function obter_total(p) result(total)
        type(peca), intent(in) :: p
        real :: total
        total = p%quantidade * p%preco        
    end function obter_total

end module modulo_peca
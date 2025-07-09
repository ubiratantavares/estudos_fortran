# Estudos da Linguagem de Programação Fortran

Repositório criado para documentar as implementações dos códigos dos estudos da linguagem Fortran.

Para separar o código Fortran em arquivos diferentes, você pode organizar seu programa em um ou mais arquivos de módulo e um arquivo principal, que contém o programa principal. 

Aqui está o processo passo a passo:

## Estrutura dos Arquivos

- **mod_app.f95**: Contém o módulo com as sub-rotinas.

- **main.f95**: Contém o programa principal que usa o módulo.

## Compilação

Para compilar os arquivos separados, você deve primeiro compilar o arquivo do módulo e depois o arquivo principal. No terminal, execute os seguintes comandos:

1. **Compilar o módulo:**

   ```shell
   gfortran -c mod_velocidade.f95
   ```

   Isso gera um arquivo de objeto (`mod_velocidade.o`) e um arquivo de módulo (`mod_velocidade.mod`).

2. **Compilar o programa principal:**

   ```shell
   gfortran -c main.f95
   ```

3. **Linkar e gerar o executável:**

   ```shell
   gfortran mod_velocidade.o main.o -o app
   ```

### NOTAS

- **`-c`**: Esta opção instrui o compilador a compilar os arquivos, mas não linká-los imediatamente, permitindo a separação de compilação de módulos e do programa principal.

- **`mod_velocidade.o` e `main.o`**: Esses são os arquivos de objeto gerados pela compilação. Eles precisam ser linkados para formar o executável.

- **`app`**: O nome do executável gerado.

### Execução

Depois de compilar, você pode executar o programa com o seguinte comando:

	```shell
	./app
	```


1. **Atualize a lista de pacotes**:

   ```sh
   sudo apt update
   ```

2. **Instale o GFortran**

   ```sh
   sudo apt install gfortran
   ```

3. **Verifique a instalação**
 
   ```sh
   gfortran --version
   ```

4. **Instale o GNUplot**

	```sh
	sudo apt install gnuplot
	```

5. **Verifique a instalação**

   ```sh
   gnuplot --version
   ```

6. **Edite o arquivo .f95**

	```sh
	nano <nome_do_arquivo>.f95
	```

7. **Compile o arquivo .f95**

	```sh
	gfortran -o <nome_do_arquivo>.exe <nome_do_arquivo>.f95
	```

8. **Execute o arquivo .exe

	```sh
	./<nome_do_arquivo>.exe
	```

9. **Edite o arquivo .gp**

	```sh
	nano <nome_do_arquivo>.gp
	```

10. **Execução do arquivo .gp**

	```sh
	gnuplot -persist plotar.gp
	```
